import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Projects',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          //Text('', style: TextStyle(color: Colors.white70, fontSize: 14)),
          _PersonalProjectCard(
            title: 'Movie Explorer',
            description:
                'A single-page application for browsing, searching and saving fav movies, built with Angular 21 and the TMDB API.',
            technologies: [
              'Angular 21',
              'RxJS',
              'HttpClient + TMDB API',
              'Tailwind',
              'SCSS',
              "Unit tests (Vitest)",
              "ESLint",
              "localStorage",
            ],
            liveUrl: 'https://movie-explorer-scafley.netlify.app/',
            githubUrl: 'https://github.com/scafley/movie-explorer',
            color: Colors.greenAccent,
            onLaunchURL: _launchURL,
          ),
          SizedBox(height: 24),
          _PersonalProjectCard(
            title: 'Flutter CRUD App',
            description:
                'CRUD app with authentication and search. BLoC + Repśository pattern. DummyJSON API demo.',
            technologies: [
              'Flutter',
              'BLoC',
              'Clean Architecture',
              'GoRouter',
              'Dio',
              'Freezed',
              'flutter_secure_storage',
            ],
            liveUrl: 'https://scafley.github.io/flutter-crud-app/',
            githubUrl: 'https://github.com/scafley/Flutter-CRUD-BLoC',
            color: Colors.green,
            onLaunchURL: _launchURL,
          ),
          SizedBox(height: 48),
          Text(
            'Selected Commercial Projects',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'All project below were developed in collaboration with a small team of 2-4 developers.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Angular',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          _ProjectCard(
            title: 'Admin Panel (CMS)',
            description:
                'A content management system featuring user and role management, interactive data tables, dynamic forms, and a news module with image upload, cropping, and thumbnail management.',
            technologies: [
              'Angular',
              'PrimeNG',
              'SCSS',
              'REST API',
              'Image Cropper',
              'FormData',
              'Local Storage',
            ],
            color: Colors.redAccent,
          ),

          _ProjectCard(
            title: 'Art Gallery',
            description:
                'A responsive portfolio website showcasing artwork organized into categories, featuring multilingual support and a contact form for custom order inquiries.',
            technologies: ['Angular', 'SCSS', 'REST API', 'Local Storage'],
            color: Colors.tealAccent,
          ),

          _ProjectCard(
            title: 'E-learning App',
            description:
                'Contributed to a legacy e-learning platform by implementing new features, supporting multiple themes, maintaining existing functionality, and resolving bugs.',
            technologies: [
              'Angular',
              'SCSS',
              'Bootstrap',
              'REST API',
              'Git',
              "Material Design",
            ],
            color: Colors.amberAccent,
          ),
          SizedBox(height: 24),
          Text(
            'Flutter',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          _ProjectCard(
            title: 'E-learning Application',
            description:
                'Educational application with interactive tasks, character creator (Unity Player) and real-time communication.',
            technologies: [
              'Flutter',
              'Dart',
              'Http/Dio',
              'SSE (Server-Sent Events)',
              'Flutter-Unity',
            ],
            color: Colors.purpleAccent,
          ),
          _ProjectCard(
            title: 'Pronunciation Learning App',
            description:
                'Educational application with audio/video task system and gamification.',
            technologies: [
              'Flutter',
              'shared_preferences',
              'JSON parsing',
              'Rive',
              'camera',
            ],
            color: Colors.orange,
          ),
          _ProjectCard(
            title: 'School Communication App',
            description:
                'Communication platform between school and parents with messaging and notification system.',
            technologies: ['Flutter', 'Http/Dio', 'OneSignal', 'BLoC (auth)'],
            color: Colors.blue,
          ),
          _ProjectCard(
            title: 'Skiing Application',
            description:
                'Application with ski routes and certificate system for users.',
            technologies: [
              'Flutter',
              'Http/Dio',
              'video_player',
              'Rive animations',
              'flutter_localizations',
              'camera',
            ],
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final Color color;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.technologies,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 24,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: technologies.map((tech) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: color.withAlpha(50),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: color.withAlpha(50)),
                ),
                child: Text(
                  tech,
                  style: TextStyle(
                    color: color,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _PersonalProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final String liveUrl;
  final String githubUrl;
  final Color color;
  final Function(String) onLaunchURL;

  const _PersonalProjectCard({
    required this.title,
    required this.description,
    required this.technologies,
    required this.liveUrl,
    required this.githubUrl,
    required this.color,
    required this.onLaunchURL,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withAlpha(50),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 24,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: technologies.map((tech) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: color.withAlpha(50),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: color.withAlpha(50)),
                ),
                child: Text(
                  tech,
                  style: TextStyle(
                    color: color,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => onLaunchURL(liveUrl),
                  icon: Icon(Icons.open_in_new, size: 18),
                  label: Text('Live Demo'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: color,
                    side: BorderSide(color: color),
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => onLaunchURL(githubUrl),
                  icon: Icon(Icons.code, size: 18),
                  label: Text('Source Code'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: color,
                    side: BorderSide(color: color),
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
