import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../dashboard/dashboard_screen.dart';

// Provider to store the GitHub Access Token so we can use it during generation
class GithubTokenNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void setToken(String token) {
    state = token;
  }
}

final githubTokenProvider = NotifierProvider<GithubTokenNotifier, String?>(GithubTokenNotifier.new);

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _isLoading = false;

  Future<void> _signInWithGitHub() async {
    setState(() => _isLoading = true);
    try {
      GithubAuthProvider githubProvider = GithubAuthProvider();
      githubProvider.addScope('repo'); // We need this to create repositories

      UserCredential userCredential;
      if (kIsWeb) {
        userCredential = await FirebaseAuth.instance.signInWithPopup(githubProvider);
      } else {
        userCredential = await FirebaseAuth.instance.signInWithProvider(githubProvider);
      }
      
      // Extract the OAuth token safely
      final cred = userCredential.credential;
      String? token;
      
      debugPrint('Credential type: ${cred.runtimeType}');
      debugPrint('Credential string: ${cred.toString()}');

      if (cred is OAuthCredential) {
        token = cred.accessToken;
        debugPrint('OAuthCredential accessToken: $token');
      } else if (cred != null) {
        // Firebase Android SDK returns a base AuthCredential but hides the token inside toString()
        final credStr = cred.toString();
        final match = RegExp(r'accessToken:\s*([^,\)]+)').firstMatch(credStr);
        if (match != null) {
          token = match.group(1);
          debugPrint('Extracted accessToken via regex: $token');
        }
      }

      if (token != null) {
        ref.read(githubTokenProvider.notifier).setToken(token);
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const DashboardScreen()),
          );
        }
      } else {
        // Fallback: show error dialog so we can see what happened
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Token Error'),
              content: const Text('Could not extract GitHub token from login.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                )
              ],
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to sign in: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Portify',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Build your portfolio in seconds.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton.icon(
                      onPressed: _signInWithGitHub,
                      icon: const Icon(Icons.login),
                      label: const Text('Continue with GitHub'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
