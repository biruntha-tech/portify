import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../dashboard/dashboard_screen.dart';
import '../../core/widgets/wavy_header.dart';

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

  @override
  void initState() {
    super.initState();
    _checkExistingSession();
  }

  Future<void> _checkExistingSession() async {
    setState(() => _isLoading = true);
    try {
      if (Firebase.apps.isNotEmpty) {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString('github_token');
          if (token != null && token.isNotEmpty) {
            ref.read(githubTokenProvider.notifier).setToken(token);
            if (mounted) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const DashboardScreen()),
              );
            }
            return;
          }
        }
      }
    } catch (e) {
      debugPrint('Error checking session: $e');
    }
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _signInWithGitHub({bool forceLogin = false}) async {
    setState(() => _isLoading = true);
    try {
      GithubAuthProvider githubProvider = GithubAuthProvider();
      githubProvider.addScope('repo'); // We need this to create repositories
      if (forceLogin) {
        githubProvider.setCustomParameters({'prompt': 'login'});
      }

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
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('github_token', token);

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
      body: Column(
        children: [
          WavyHeader(
            height: 340.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'lib/app_logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Portify',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Build your portfolio in seconds.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w300,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),
                    Card(
                      elevation: 8,
                      shadowColor: Colors.deepPurple.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Welcome',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Sign in to manage and build your developer portfolios',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 32),
                            _isLoading
                                ? const Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 20.0),
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: () => _signInWithGitHub(forceLogin: false),
                                        icon: const Icon(Icons.login),
                                        label: const Text('Continue with GitHub'),
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(vertical: 16),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          elevation: 2,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      OutlinedButton.icon(
                                        onPressed: () => _signInWithGitHub(forceLogin: true),
                                        icon: const Icon(Icons.switch_account),
                                        label: const Text('Switch Account on GitHub'),
                                        style: OutlinedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(vertical: 16),
                                          side: BorderSide(
                                            color: Theme.of(context).colorScheme.primary,
                                            width: 1.5,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
