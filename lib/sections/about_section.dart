import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Professional Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Graduate of Computer Science at the Pedagogical University in Krakow with over 3 years of commercial experience in creating mobile applications in Flutter. Previously worked on web applications using Angular framework. In commercial projects, I was responsible for implementing frontend functionalities, creating responsive user interfaces and API integration. Ready to take on new challenges immediately.',
            style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.6),
          ),
          SizedBox(height: 32),
          Text(
            'Technical Skills',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          _SkillItem(
            title: 'Flutter',
            description:
                'Creating UI based on Figma designs, REST API integration (Dio/Http), Riverpod, animations (Rive), Flutter-Unity, shared_preferences, OneSignal, BLoC (basics)',
          ),
          _SkillItem(
            title: 'Web',
            description:
                'HTML5, CSS/SCSS, Bootstrap, Angular, TypeScript/JavaScript',
          ),
          _SkillItem(
            title: 'Tools',
            description: 'Git/SVN, Postman, Figma, VS Code, Photoshop',
          ),
          SizedBox(height: 32),
          Text(
            'Languages',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              _LanguageChip(language: 'Polish', level: 'Native'),
              SizedBox(width: 12),
              _LanguageChip(language: 'English', level: 'B2'),
            ],
          ),
          SizedBox(height: 32),
          Text(
            'Interests & Hobbies',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _HobbyChip(icon: Icons.sports_soccer, label: 'Football'),
              _HobbyChip(icon: Icons.movie, label: 'Cinema'),
              _HobbyChip(
                icon: Icons.videogame_asset,
                label: 'Gaming & E-sport',
              ),
              _HobbyChip(icon: Icons.restaurant, label: 'Cooking'),
            ],
          ),
        ],
      ),
    );
  }
}

class _SkillItem extends StatelessWidget {
  final String title;
  final String description;

  const _SkillItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(color: Colors.white60, fontSize: 15, height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _LanguageChip extends StatelessWidget {
  final String language;
  final String level;

  const _LanguageChip({required this.language, required this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            language,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              level,
              style: TextStyle(
                color: Colors.blue.shade200,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HobbyChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HobbyChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white70, size: 18),
          SizedBox(width: 8),
          Text(label, style: TextStyle(color: Colors.white70, fontSize: 14)),
        ],
      ),
    );
  }
}
