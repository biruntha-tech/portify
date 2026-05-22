import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../core/services/github_service.dart';
import '../../core/templates/portfolio_template.dart';
import '../auth/login_screen.dart';

class GenerationScreen extends ConsumerStatefulWidget {
  final String name;
  final String bio;
  final String skills;
  final String projects;
  final String githubUrl;
  final String linkedinUrl;
  final String primaryColor;
  final PortfolioTemplate template;

  const GenerationScreen({
    super.key,
    required this.name,
    required this.bio,
    required this.skills,
    required this.projects,
    required this.githubUrl,
    required this.linkedinUrl,
    required this.primaryColor,
    required this.template,
  });

  @override
  ConsumerState<GenerationScreen> createState() => _GenerationScreenState();
}

class _GenerationScreenState extends ConsumerState<GenerationScreen> {
  String _status = 'Initializing generator...';
  double _progress = 0.1;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => _generateAndDeploy());
  }

  Future<void> _generateAndDeploy() async {
    try {
      final token = ref.read(githubTokenProvider);
      if (token == null) {
        throw Exception('GitHub token not found. Please log in with GitHub again.');
      }

      final github = GithubService();
      final safeName = widget.name.toLowerCase().replaceAll(RegExp(r'\s+'), '-');
      final repoName = 'portfolio-$safeName-${DateTime.now().millisecondsSinceEpoch}';

      setState(() {
        _status = 'Creating GitHub repository...';
        _progress = 0.2;
      });

      final fullRepoName = await github.createRepository(token, repoName);

      if (!mounted) return;
      setState(() {
        _status = 'Pushing code to repository...';
        _progress = 0.5;
      });

      final htmlContent = widget.template.generateHtml(
        name: widget.name,
        bio: widget.bio,
        skills: widget.skills,
        projects: widget.projects,
        githubUrl: widget.githubUrl,
        linkedinUrl: widget.linkedinUrl,
        primaryColor: widget.primaryColor,
      );

      await github.pushFile(token, fullRepoName, 'index.html', htmlContent, 'Initial commit: Generate portfolio');

      if (!mounted) return;
      setState(() {
        _status = 'Enabling GitHub Pages...';
        _progress = 0.8;
      });

      final liveUrl = await github.enablePages(token, fullRepoName);

      if (!mounted) return;
      setState(() {
        _status = 'Saving details...';
        _progress = 0.9;
      });

      // Save to shared preferences
      final prefs = await SharedPreferences.getInstance();
      final portfoliosJson = prefs.getStringList('portfolios') ?? [];
      
      final newPortfolio = {
        'name': widget.name,
        'repo': fullRepoName,
        'liveUrl': liveUrl,
        'createdAt': DateTime.now().toIso8601String(),
        'template': widget.template.title,
      };
      
      portfoliosJson.add(jsonEncode(newPortfolio));
      await prefs.setStringList('portfolios', portfoliosJson);

      if (!mounted) return;
      setState(() {
        _status = 'Done!';
        _progress = 1.0;
      });
      
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text('Success!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Your portfolio has been generated and deployed!'),
              const SizedBox(height: 8),
              const Text(
                'Note: It may take a few minutes for GitHub Pages to build and publish your site. If you see a 404 error, please wait a moment and refresh the page.',
                style: TextStyle(color: Colors.orange, fontSize: 13),
              ),
              const SizedBox(height: 16),
              const Text('Live URL:', style: TextStyle(fontWeight: FontWeight.bold)),
              InkWell(
                onTap: () => launchUrl(Uri.parse(liveUrl)),
                child: Text(liveUrl, style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline)),
              ),
              const SizedBox(height: 16),
              const Text('GitHub Repo:', style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Expanded(child: Text('https://github.com/$fullRepoName')),
                  IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: 'https://github.com/$fullRepoName'));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Copied to clipboard!')),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context).pop(); // Go back to dashboard
              },
              child: const Text('Back to Dashboard'),
            ),
          ],
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _status = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 32),
              Text(
                _status,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              LinearProgressIndicator(
                value: _progress,
                minHeight: 8,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
