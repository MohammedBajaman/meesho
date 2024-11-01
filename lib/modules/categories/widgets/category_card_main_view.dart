import 'package:flutter/material.dart';
import 'package:mesho/utils/global_text_styles.dart';

class CategoryCardMainView extends StatelessWidget {
  final GlobalTextStyles _globalTextStyles = GlobalTextStyles();
  final String categoryName;
  final List<String> subCategoryNames;
  final String categoryImage;
  final String productName;

  CategoryCardMainView({super.key, required this.categoryName, required this.subCategoryNames, required this.categoryImage, required this.productName});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // category name
        categorySeparator(categoryName),
        const SizedBox(height: 16.21),

        // sub categories
        ListView.builder(
          controller: _scrollController,
          itemCount: subCategoryNames.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            String subCategory = subCategoryNames[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _globalTextStyles.h2(subCategory),
                const SizedBox(height: 12.43),

                // product card
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      productCard(productImage: categoryImage, productName: productName),
                      const SizedBox(width: 16.75),
                      productCard(productImage: categoryImage, productName: productName),
                      const SizedBox(width: 16.75),
                      productCard(productImage: categoryImage, productName: productName),
                    ],
                  ),
                ),
                const SizedBox(height: 19.21),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      productCard(productImage: categoryImage, productName: productName),
                      const SizedBox(width: 16.75),
                      productCard(productImage: categoryImage, productName: productName),
                      const SizedBox(width: 16.75),
                      productCard(productImage: categoryImage, productName: productName),
                    ],
                  ),
                ),
                const SizedBox(height: 21.22),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget categorySeparator(String categoryName) {
    return Row(
      children: [
        _globalTextStyles.h3(categoryName),
        const SizedBox(width: 5.09),

        // divider
        Expanded(
          child: SizedBox(
            child: Divider(
              height: 1,
              color: Colors.black.withOpacity(0.2),
            ),
          ),
        ),
      ],
    );
  }

  // Widget productCard({required String productImage, required String productName}) {
  //   return Column(
  //     children: [
  //       // image
  //       Container(
  //         height: 88.32,
  //         width: 69.25,
  //         decoration: BoxDecoration(
  //           image: DecorationImage(image: AssetImage(productImage)),
  //         ),
  //       ),
  //
  //       // name
  //       Container(
  //         height: 21.24,
  //         width: 67.98,
  //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white, boxShadow: [
  //           BoxShadow(
  //             color: Colors.black.withOpacity(0.06),
  //             offset: const Offset(0, 2),
  //             blurRadius: 6,
  //           ),
  //         ]),
  //         child: _globalTextStyles.h4(
  //           productName,
  //           isSelected: true,
  //         ),
  //       ),
  //     ],
  //   );
  // }


  Widget productCard({required String productImage, required String productName}) {
    return Column(
      children: [
        // Image with fixed constraints
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 69.25, maxHeight: 88.32),
          child: AspectRatio(
            aspectRatio: 69.25 / 88.32, // width / height ratio for image container
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(productImage)),
              ),
            ),
          ),
        ),

        // const SizedBox(height: 8), // Optional space between elements

        // Name with fixed constraints
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 67.98, maxHeight: 21.24),
          child: AspectRatio(
            aspectRatio: 67.98 / 21.24, // width / height ratio for name container
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    offset: const Offset(0, 2),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Center(
                child: _globalTextStyles.h4(
                  productName,
                  isSelected: true,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}
