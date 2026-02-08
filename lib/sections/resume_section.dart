import 'package:flutter/material.dart';

class CVSection extends StatelessWidget {
  const CVSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Work Experience',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),
          _ExperienceItem(
            period: 'February 2021 - present',
            company: '"Poliman" Paweł Szeląg',
            position: 'Front-End Developer',
            responsibilities: [
              'Creating and developing mobile applications in Flutter framework',
              'Creating and developing web applications using Angular framework',
            ],
          ),
          _ExperienceItem(
            period: 'September 2020 - November 2020',
            company: 'SuprAI',
            position: 'Junior Front-End Developer (internship)',
            responsibilities: [
              'Graphic design using Figma application',
              'Creating web application based on graphic design (HTML5, SCSS, Bootstrap, jQuery, JavaScript)',
            ],
          ),
          _ExperienceItem(
            period: 'October 2018',
            company: '"Millenium Studio" Daniel Różański',
            position: 'Junior Front-End Developer (monthly internship)',
            responsibilities: [
              'Creating web applications using: HTML5, SCSS, Bootstrap 4, jQuery, Vue.js',
            ],
          ),
          SizedBox(height: 32),
          Text(
            'Education',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),
          _EducationItem(
            period: '2016 - 2021',
            school: 'Pedagogical University of Kraków',
            degree: 'Master of Engineering, Computer Science',
          ),
          _EducationItem(
            period: '2012 - 2016',
            school: 'Andrzej Średniawski School Complex in Myślenice',
            degree: 'IT Technician',
          ),
        ],
      ),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final String period;
  final String company;
  final String position;
  final List<String> responsibilities;

  const _ExperienceItem({
    required this.period,
    required this.company,
    required this.position,
    required this.responsibilities,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 12,
            height: 12,
            margin: EdgeInsets.only(top: 5, right: 16),
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  period,
                  style: TextStyle(
                    color: Colors.blue.shade300,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  company,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  position,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 12),
                ...responsibilities.map(
                  (resp) => Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• ',
                          style: TextStyle(color: Colors.white60, fontSize: 15),
                        ),
                        Expanded(
                          child: Text(
                            resp,
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 15,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
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

class _EducationItem extends StatelessWidget {
  final String period;
  final String school;
  final String degree;

  const _EducationItem({
    required this.period,
    required this.school,
    required this.degree,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 12,
            height: 12,
            margin: EdgeInsets.only(top: 5, right: 16),
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  period,
                  style: TextStyle(
                    color: Colors.green.shade300,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  school,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  degree,
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
