class PortfolioTemplate {
  final String id;
  final String title;
  final String type;
  final String imageUrl;

  // The function that generates the actual HTML string
  final String Function({
    required String name,
    required String bio,
    required String skills,
    required String projects,
    required String githubUrl,
    required String linkedinUrl,
    required String primaryColor,
  }) generateHtml;

  const PortfolioTemplate({
    required this.id,
    required this.title,
    required this.type,
    required this.imageUrl,
    required this.generateHtml,
  });
}
