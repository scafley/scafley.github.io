import 'package:cv2026/sections/portfolio_projects_section.dart';
import 'package:cv2026/widgets/menu_button.dart';
import 'package:cv2026/widgets/menu_widget.dart';
import 'package:cv2026/widgets/personal_data.dart';
import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1a1918),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                              border: Border.all(
                                width: 1,
                                color: Colors.white24,
                              ),
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
                                        MenuButton(
                                          label: 'Portfolio',
                                          isSelected: true,
                                          onTap: () {},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                PortfolioProjectsSection(),
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
                            border:
                                Border.all(width: 1, color: Colors.white24),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MenuWidget(
                                    buttons: [
                                      MenuButton(
                                        label: 'Portfolio',
                                        isSelected: true,
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              PortfolioProjectsSection(),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "© 2026 Dominik Nalepa • 100% Flutter Web",
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
                FlutterLogo(size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
