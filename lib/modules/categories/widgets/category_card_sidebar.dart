import 'package:flutter/material.dart';
import 'package:mesho/main.dart';
import 'package:mesho/utils/global_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryCardSidebar extends StatelessWidget {
  final GlobalTextStyles _globalTextStyles = GlobalTextStyles();
  final String categoryImage;
  final String categoryName;
  final bool isCategorySelected;
  final void Function()? onTap;

  CategoryCardSidebar({
    super.key,
    required this.categoryImage,
    required this.categoryName,
    this.isCategorySelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            indicatorHeight.value = context.size?.height;
          },
        );

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
                SizedBox(height: 1.5.h),

                // circle image
                Container(
                  height: 5.2.h,
                  width: 5.2.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(categoryImage)),
                    shape: BoxShape.circle,
                    color: const Color(0xfff0eeff),
                  ),
                ),
                // const SizedBox(height: 5.5),
                SizedBox(height: 0.7.h),

                // category name
                _globalTextStyles.h4(categoryName, isSelected: isCategorySelected),

                SizedBox(height: 1.5.h),

                const Divider(height: 0, thickness: 1, color: Color(0xffF0F0F0)),
              ],
            ),
          ),
        );
      },
    );
  }
}
