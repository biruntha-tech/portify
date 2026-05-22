import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/templates/portfolio_template.dart';
import '../../core/services/github_service.dart';
import '../auth/login_screen.dart';
import '../generation/generation_screen.dart';

class BuilderFormScreen extends ConsumerStatefulWidget {
  final PortfolioTemplate template;
  const BuilderFormScreen({super.key, required this.template});

  @override
  ConsumerState<BuilderFormScreen> createState() => _BuilderFormScreenState();
}

class _BuilderFormScreenState extends ConsumerState<BuilderFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _bioController = TextEditingController();
  final _skillsController = TextEditingController();
  final _projectsController = TextEditingController();
  final _githubController = TextEditingController();
  final _linkedinController = TextEditingController();
  
  String _selectedColor = '#3b82f6'; // Default to blue

  final List<Map<String, String>> _themeColors = [
    {'name': 'Blue', 'hex': '#3b82f6', 'color': '0xFF3B82F6'},
    {'name': 'Purple', 'hex': '#8b5cf6', 'color': '0xFF8B5CF6'},
    {'name': 'Emerald', 'hex': '#10b981', 'color': '0xFF10B981'},
    {'name': 'Rose', 'hex': '#f43f5e', 'color': '0xFFF43F5E'},
    {'name': 'Amber', 'hex': '#f59e0b', 'color': '0xFFF59E0B'},
  ];

  bool _isLoadingProfile = true;

  @override
  void initState() {
    super.initState();
    _fetchGithubProfile();
  }

  Future<void> _fetchGithubProfile() async {
    final token = ref.read(githubTokenProvider);
    if (token != null && token.isNotEmpty) {
      try {
        final profile = await GithubService().getUserProfile(token);
        if (mounted) {
          setState(() {
            _nameController.text = profile['name'] ?? profile['login'] ?? '';
            _bioController.text = profile['bio'] ?? '';
            _githubController.text = profile['html_url'] ?? '';
            if (profile['blog'] != null && profile['blog'].toString().isNotEmpty) {
              _linkedinController.text = profile['blog'];
            }
          });
        }
      } catch (e) {
        debugPrint('Error fetching github profile: $e');
      }
    }
    if (mounted) {
      setState(() => _isLoadingProfile = false);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _skillsController.dispose();
    _projectsController.dispose();
    _githubController.dispose();
    _linkedinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customize ${widget.template.title}'),
      ),
      body: _isLoadingProfile
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _bioController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Bio (AI Enhanced later)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _skillsController,
              decoration: const InputDecoration(
                labelText: 'Skills (Comma separated)',
                hintText: 'Flutter, Dart, Firebase, UI/UX',
                border: OutlineInputBorder(),
              ),
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _projectsController,
              decoration: const InputDecoration(
                labelText: 'Projects (Comma separated)',
                hintText: 'E-commerce App, Chatbot, Weather App',
                border: OutlineInputBorder(),
              ),
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _githubController,
              decoration: const InputDecoration(
                labelText: 'GitHub Profile URL',
                hintText: 'https://github.com/username',
                border: OutlineInputBorder(),
              ),
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _linkedinController,
              decoration: const InputDecoration(
                labelText: 'LinkedIn Profile URL',
                hintText: 'https://linkedin.com/in/username',
                border: OutlineInputBorder(),
              ),
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 24),
            const Text('Select Primary Theme Color', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _themeColors.map((colorMap) {
                final isSelected = _selectedColor == colorMap['hex'];
                return GestureDetector(
                  onTap: () => setState(() => _selectedColor = colorMap['hex']!),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(int.parse(colorMap['color']!)),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? Colors.white : Colors.transparent,
                        width: 3,
                      ),
                      boxShadow: isSelected
                          ? [BoxShadow(color: Color(int.parse(colorMap['color']!)).withOpacity(0.5), blurRadius: 10, spreadRadius: 2)]
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenerationScreen(
                        name: _nameController.text,
                        bio: _bioController.text,
                        skills: _skillsController.text,
                        projects: _projectsController.text,
                        githubUrl: _githubController.text,
                        linkedinUrl: _linkedinController.text,
                        primaryColor: _selectedColor,
                        template: widget.template,
                      ),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
              ),
              child: const Text('Generate Website'),
            ),
          ],
        ),
      ),
    );
  }
}
