import 'package:flutter/material.dart';
import '../builder/builder_form_screen.dart';

import '../../core/templates/html_templates.dart';
import 'dart:ui';

class TemplateSelectionScreen extends StatefulWidget {
  const TemplateSelectionScreen({super.key});

  @override
  State<TemplateSelectionScreen> createState() => _TemplateSelectionScreenState();
}

class _TemplateSelectionScreenState extends State<TemplateSelectionScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Choose Design', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // Dynamic Background (Blurred version of current template image)
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Container(
              key: ValueKey<int>(_currentPage),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(appTemplates[_currentPage].imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                child: Container(
                  color: Colors.white.withValues(alpha: 0.85), // Light overlay
                ),
              ),
            ),
          ),
          
          // Wavy Purple Header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: WavyHeaderClipper(),
              child: Container(
                height: 320,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF673AB7), Color(0xFF9C27B0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Craft your',
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w300,
                            height: 1.1,
                            letterSpacing: -1,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'unique portfolio.',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            height: 1.1,
                            letterSpacing: -1,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          // Carousel
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 130), // Push the carousel down so the text is visible
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: appTemplates.length,
                    itemBuilder: (context, index) {
                      final template = appTemplates[index];
                      final bool isActive = index == _currentPage;
                      
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOutQuint,
                        margin: EdgeInsets.only(
                          left: 12,
                          right: 12,
                          top: isActive ? 0 : 50,
                          bottom: isActive ? 40 : 90,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: isActive ? 0.25 : 0.0),
                              blurRadius: 40,
                              offset: const Offset(0, 20),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(36),
                          child: Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BuilderFormScreen(template: template),
                                  ),
                                );
                              },
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                    template.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                  // Gradient Overlay
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black.withValues(alpha: 0.9),
                                        ],
                                        stops: const [0.4, 1.0],
                                      ),
                                    ),
                                  ),
                                  // Content
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                            decoration: BoxDecoration(
                                              color: Colors.deepPurpleAccent,
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            child: Text(
                                              template.type,
                                              style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Text(
                                            template.title,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 32,
                                              fontWeight: FontWeight.w900,
                                              letterSpacing: -1,
                                            ),
                                          ),
                                          const SizedBox(height: 30),
                                          SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => BuilderFormScreen(template: template),
                                                  ),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                foregroundColor: Colors.black87,
                                                padding: const EdgeInsets.symmetric(vertical: 20),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                elevation: 0,
                                              ),
                                              child: const Text('Use This Design', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                            ),
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
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WavyHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);

    final firstControlPoint = Offset(size.width / 4, size.height);
    final firstEndPoint = Offset(size.width / 2, size.height - 40);
    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    final secondControlPoint = Offset(size.width * 3 / 4, size.height - 80);
    final secondEndPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
