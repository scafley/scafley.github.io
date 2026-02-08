import 'package:cv2026/sections/about_section.dart';

import 'package:cv2026/sections/projects_section.dart';
import 'package:cv2026/sections/resume_section.dart';
import 'package:cv2026/widgets/menu_button.dart';
import 'package:cv2026/widgets/menu_widget.dart';
import 'package:cv2026/widgets/personal_data.dart';
import 'package:flutter/material.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  int _selectedSection = 0;

  final List<String> _sections = ['About', 'Resume', 'Projects'];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1a1918),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "© 2026 Dominik Nalepa • 100% Flutter Web ",
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
            FlutterLogo(size: 16),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: MediaQuery.of(context).size.width > 800
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PersonalDataWidget(),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF32312f),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(width: 1, color: Colors.white24),
                      ),
                      constraints: BoxConstraints(minHeight: 600),
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MenuWidget(
                                buttons: [
                                  for (var (index, name)
                                      in _sections.indexed) ...[
                                    MenuButton(
                                      label: name,
                                      isSelected: _selectedSection == index,
                                      onTap: () {
                                        _selectedSection = index;
                                        setState(() {});
                                      },
                                    ),
                                  ],
                                ],
                              ),
                            ],
                          ),
                          switch (_selectedSection) {
                            0 => AboutSection(),
                            1 => CVSection(),
                            2 => ProjectsSection(),
                            _ => SizedBox(),
                          },
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [PersonalDataWidget()],
                  ),
                  Container(
                    constraints: BoxConstraints(minHeight: 600),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFF32312f),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 1, color: Colors.white24),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MenuWidget(
                              buttons: [
                                for (var (index, name)
                                    in _sections.indexed) ...[
                                  MenuButton(
                                    label: name,
                                    isSelected: _selectedSection == index,
                                    onTap: () {
                                      _selectedSection = index;
                                      setState(() {});
                                    },
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                        switch (_selectedSection) {
                          0 => AboutSection(),
                          1 => CVSection(),
                          2 => ProjectsSection(),
                          _ => SizedBox(),
                        },
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
