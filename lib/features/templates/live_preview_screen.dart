import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../core/templates/portfolio_template.dart';

class LivePreviewScreen extends StatefulWidget {
  final PortfolioTemplate template;

  const LivePreviewScreen({super.key, required this.template});

  @override
  State<LivePreviewScreen> createState() => _LivePreviewScreenState();
}

class _LivePreviewScreenState extends State<LivePreviewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    final htmlContent = widget.template.generateHtml(
      name: 'John Doe',
      bio: 'Full Stack Developer & Open Source Contributor. Building scalable apps with modern technologies.',
      skills: 'Flutter, Dart, Firebase, Node.js, React',
      projects: 'E-Commerce Platform, Chat Application, Portfolio Generator',
      githubUrl: 'https://github.com',
      linkedinUrl: 'https://linkedin.com',
      primaryColor: '#8b5cf6',
    );

    _controller = WebViewController()
      ..setBackgroundColor(const Color(0x00000000));
    
    if (!kIsWeb) {
      _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    }
    
    _controller.loadHtmlString(htmlContent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.template.title} (Live Demo)'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}
