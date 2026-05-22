import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import '../templates/template_selection_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/login_screen.dart';
import '../../core/widgets/wavy_header.dart';
import '../profile/profile_screen.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  List<Map<String, dynamic>> _portfolios = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPortfolios();
  }

  Future<void> _loadPortfolios() async {
    final prefs = await SharedPreferences.getInstance();
    final portfoliosJson = prefs.getStringList('portfolios') ?? [];
    
    List<Map<String, dynamic>> loadedPortfolios = portfoliosJson
        .map((e) => jsonDecode(e) as Map<String, dynamic>)
        .toList();

    // Try fetching from Firebase Firestore
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('portfolios')
            .get();
            
        if (snapshot.docs.isNotEmpty) {
          loadedPortfolios = snapshot.docs.map((d) => d.data()).toList();
          // Optional: Sort by createdAt if we added that logic
          loadedPortfolios.sort((a, b) {
             final dateA = a['createdAt'] ?? '';
             final dateB = b['createdAt'] ?? '';
             return dateA.compareTo(dateB);
          });
        }
      }
    } catch (e) {
      debugPrint('Error fetching from Firestore: $e');
    }

    if (mounted) {
      setState(() {
        _portfolios = loadedPortfolios.reversed.toList();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading 
        ? const Center(child: CircularProgressIndicator()) 
        : Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  WavyHeader(
                    height: 250.0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Welcome back,',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.85),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                FirebaseAuth.instance.currentUser?.displayName ?? 'Developer',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.account_circle, size: 36, color: Colors.white),
                            tooltip: 'View Profile',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ProfileScreen()),
                              ).then((_) => _loadPortfolios());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    left: 24,
                    right: 24,
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildStatCard(context, 'Total Websites', _portfolios.length.toString(), Icons.web),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildStatCard(context, 'Live Sites', _portfolios.length.toString(), Icons.cloud_done),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 66),
              Expanded(
                child: _portfolios.isEmpty 
                  ? Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.dashboard_customize, size: 80, color: Colors.deepPurple),
                            const SizedBox(height: 24),
                            Text(
                              'Welcome to Portify!',
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'You have no portfolios yet. Start building your professional online presence today.',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 32),
                            ElevatedButton.icon(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const TemplateSelectionScreen()),
                                ).then((_) => _loadPortfolios());
                              },
                              label: const Text('Create New Website'),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                      itemCount: _portfolios.length,
                      itemBuilder: (context, index) {
                        final portfolio = _portfolios[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          elevation: 4,
                          shadowColor: Colors.black.withOpacity(0.05),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            leading: const CircleAvatar(
                              backgroundColor: Colors.deepPurple,
                              child: Icon(Icons.language, color: Colors.white),
                            ),
                            title: Text(portfolio['name'] ?? 'My Portfolio', style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text('Template: ${portfolio['template'] ?? 'Unknown'}'),
                                const SizedBox(height: 4),
                                Text('Repo: ${portfolio['repo'] ?? ''}', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.open_in_new, color: Colors.blue),
                              tooltip: 'Open Live Site',
                              onPressed: () {
                                if (portfolio['liveUrl'] != null) {
                                  launchUrl(Uri.parse(portfolio['liveUrl']));
                                }
                              },
                            ),
                          ),
                        );
                      },
                    ),
              ),
            ],
          ),
      floatingActionButton: _portfolios.isNotEmpty
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TemplateSelectionScreen()),
                ).then((_) => _loadPortfolios());
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon) {
    return Card(
      elevation: 6,
      shadowColor: Colors.deepPurple.withOpacity(0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.deepPurple, size: 28),
            const SizedBox(height: 12),
            Text(
              value, 
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold, 
                    color: Colors.deepPurple,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              title, 
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
