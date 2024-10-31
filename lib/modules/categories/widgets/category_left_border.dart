import 'package:flutter/material.dart';
import 'package:mesho/main.dart';

class CategoryLeftBorder extends StatelessWidget {
  final int selectedIndex;

  const CategoryLeftBorder({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: /*4.5*/ 0),
      child: ValueListenableBuilder(
        valueListenable: indicatorHeight,
        builder: (context, value, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 3.06,
            height: value ?? 87.36,
            // margin: EdgeInsets.only(top: (87.36 * 1.13) * selectedIndex),
            margin: EdgeInsets.only(top: (value ?? 0) * selectedIndex),
            decoration: const BoxDecoration(
              color: Color(0xff8034DA),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          );
        },
      ),
    );
  }
}
