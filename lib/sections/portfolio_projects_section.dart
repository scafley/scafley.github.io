import 'package:cv2026/widgets/gallery_dialog.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioProjectsSection extends StatelessWidget {
  const PortfolioProjectsSection({super.key});

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
          Text(
            'Side projects showcasing modern Flutter architecture and best practices.',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          SizedBox(height: 24),
          _PersonalProjectCard(
            title: 'Flutter CRUD App',
            description:
                'CRUD app with authentication and search. BLoC + Repository pattern. DummyJSON API demo.',
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
            images: const [],
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
            images: const [
              'assets/images/projects/elearning_app/screen1.png',
              'assets/images/projects/elearning_app/screen2.png',
              'assets/images/projects/elearning_app/screen3.png',
              'assets/images/projects/elearning_app/screen4.png',
            ],
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
            images: const [
              'assets/images/projects/pronunciation_app/screen1.png',
              'assets/images/projects/pronunciation_app/screen2.png',
              'assets/images/projects/pronunciation_app/screen3.png',
              'assets/images/projects/pronunciation_app/screen4.png',
            ],
          ),
          _ProjectCard(
            title: 'School Communication App',
            description:
                'Communication platform between school and parents with messaging and notification system.',
            technologies: ['Flutter', 'Http/Dio', 'OneSignal', 'BLoC (auth)'],
            color: Colors.blue,
            images: const [
              'assets/images/projects/school_comm_app/screen1.png',
              'assets/images/projects/school_comm_app/screen2.png',
              'assets/images/projects/school_comm_app/screen3.png',
              'assets/images/projects/school_comm_app/screen4.png',
            ],
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
            images: const [
              'assets/images/projects/skiing_app/screen1.png',
              'assets/images/projects/skiing_app/screen2.png',
              'assets/images/projects/skiing_app/screen3.png',
              'assets/images/projects/skiing_app/screen4.png',
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Shared thumbnail grid
// ---------------------------------------------------------------------------

class _ThumbnailGrid extends StatelessWidget {
  final List<String> images;
  final Color color;
  final double height;

  const _ThumbnailGrid({
    required this.images,
    required this.color,
    this.height = 150,
  });

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return _Placeholder(color: color, height: height);
    }

    final show = images.length > 4 ? 4 : images.length;
    final extra = images.length - 4;

    return SizedBox(
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: show == 1
            ? _Thumb(images[0], images, 0, color)
            : GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                children: List.generate(show, (i) {
                  final isLast = i == 3 && extra > 0;
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      _Thumb(images[i], images, i, color),
                      if (isLast)
                        Container(
                          color: Colors.black54,
                          child: Center(
                            child: Text(
                              '+$extra',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                }),
              ),
      ),
    );
  }
}

class _Thumb extends StatelessWidget {
  final String path;
  final List<String> all;
  final int index;
  final Color color;

  const _Thumb(this.path, this.all, this.index, this.color);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showGallery(context, all, index),
      child: Image.asset(
        path,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => Container(
          color: color.withAlpha(20),
          child: Icon(Icons.broken_image_outlined, color: color.withAlpha(80)),
        ),
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  final Color color;
  final double height;

  const _Placeholder({required this.color, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withAlpha(80)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_photo_alternate_outlined,
              color: color.withAlpha(120),
              size: 32,
            ),
            SizedBox(height: 8),
            Text(
              'No images',
              style: TextStyle(color: color.withAlpha(120), fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Commercial project card
// ---------------------------------------------------------------------------

class _ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final Color color;
  final List<String> images;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.technologies,
    required this.color,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;

    return Container(
      margin: EdgeInsets.only(bottom: 24),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildContent()),
                SizedBox(width: 20),
                SizedBox(
                  width: 200,
                  child: _ThumbnailGrid(
                    images: images,
                    color: color,
                    height: 150,
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ThumbnailGrid(images: images, color: color, height: 160),
                SizedBox(height: 16),
                _buildContent(),
              ],
            ),
    );
  }

  Widget _buildContent() {
    return Column(
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
    );
  }
}

// ---------------------------------------------------------------------------
// Personal project card
// ---------------------------------------------------------------------------

class _PersonalProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final String liveUrl;
  final String githubUrl;
  final Color color;
  final Function(String) onLaunchURL;
  final List<String> images;

  const _PersonalProjectCard({
    required this.title,
    required this.description,
    required this.technologies,
    required this.liveUrl,
    required this.githubUrl,
    required this.color,
    required this.onLaunchURL,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;

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
      child: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildContent(context)),
                SizedBox(width: 20),
                SizedBox(
                  width: 200,
                  child: _ThumbnailGrid(
                    images: images,
                    color: color,
                    height: 170,
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ThumbnailGrid(images: images, color: color, height: 160),
                SizedBox(height: 16),
                _buildContent(context),
              ],
            ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
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
    );
  }
}
