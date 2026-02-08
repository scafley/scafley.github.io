import 'package:cv2026/widgets/menu_button.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final List<MenuButton> buttons;

  const MenuWidget({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: Color(0xFF32312f),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: Colors.white24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var a in buttons) ...[a],
        ],
      ),
    );
  }
}
