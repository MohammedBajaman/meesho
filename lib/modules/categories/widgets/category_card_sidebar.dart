import 'package:flutter/material.dart';
import 'package:mesho/utils/global_text_styles.dart';

class CategoryCardSidebar extends StatelessWidget {
  final GlobalTextStyles _globalTextStyles = GlobalTextStyles();
  final String categoryImage;
  final String categoryName;
  final bool isCategorySelected;
  final void Function()? onTap;

  CategoryCardSidebar({super.key, required this.categoryImage, required this.categoryName, this.isCategorySelected = false, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isCategorySelected ? Colors.white : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 13.96),

            // circle image
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(categoryImage)),
                shape: BoxShape.circle,
                color: const Color(0xfff0eeff),
              ),
            ),
            const SizedBox(height: 5.5),

            // category name
            _globalTextStyles.h4(categoryName, isSelected: isCategorySelected),

            const SizedBox(height: 13),

            const Divider(height: 0, thickness: 1, color: Color(0xffF0F0F0)),
          ],
        ),
      ),
    );
  }
}
