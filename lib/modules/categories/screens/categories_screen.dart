import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mesho/main.dart';
import 'package:mesho/modules/categories/models/category_model.dart';
import 'package:mesho/modules/categories/models/sidebar_category_model.dart';
import 'package:mesho/modules/categories/widgets/category_card_main_view.dart';
import 'package:mesho/modules/categories/widgets/category_card_sidebar.dart';
import 'package:mesho/modules/categories/widgets/category_left_border.dart';
import 'package:mesho/utils/global_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final GlobalTextStyles _globalTextStyles = GlobalTextStyles();
  final ScrollController _contentScrollController = ScrollController();
  final ScrollController _sidebarScrollController = ScrollController();

  final List<SidebarCategoryModel> sideBarCategories = [
    SidebarCategoryModel(image: 'assets/images/kids.png', name: 'Kids'),
    SidebarCategoryModel(image: 'assets/images/mobile.png', name: 'Mobile'),
    SidebarCategoryModel(image: 'assets/images/headphone.png', name: 'Electronics'),
    SidebarCategoryModel(image: 'assets/images/women.png', name: 'Women'),
    SidebarCategoryModel(image: 'assets/images/men.png', name: 'Men'),
    SidebarCategoryModel(image: 'assets/images/decor.png', name: 'Decor'),
    SidebarCategoryModel(image: 'assets/images/furniture.png', name: 'Furniture'),
  ];
  String selectedCategory = 'Kids';
  ValueNotifier<int> selectedIndex = ValueNotifier(0);
  bool zoomIn = true;
  final TransformationController _transformationController = TransformationController();
  double _currentScale = 1.0;

  final List<CategoryModel> categories = [
    CategoryModel(
      categoryName: 'Kids',
      subCategoryNames: ['Boys & Girls', 'Infant 0-2 Years'],
      categoryImage: 'assets/images/women_shirt.png',
      productName: 'Shirt',
    ),
    CategoryModel(
      categoryName: 'Mobile',
      subCategoryNames: ['IOS', 'Android'],
      categoryImage: 'assets/images/iphone.webp',
      productName: 'Iphone',
    ),
    CategoryModel(
      categoryName: 'Electronics',
      subCategoryNames: ['Accessories', 'Audio'],
      categoryImage: 'assets/images/electronics.webp',
      productName: 'Headphone',
    ),
    CategoryModel(
      categoryName: 'Women',
      subCategoryNames: ['Upper wear', 'Lower wear'],
      categoryImage: 'assets/images/women_shirt.png',
      productName: 'Shirt',
    ),
    CategoryModel(
      categoryName: 'Men',
      subCategoryNames: ['Top wear', 'Bottom wear'],
      categoryImage: 'assets/images/men.webp',
      productName: 'T-Shirt',
    ),
    CategoryModel(
      categoryName: 'Decor',
      subCategoryNames: ['Wall Art', 'Lighting'],
      categoryImage: 'assets/images/decor2.jpeg',
      productName: 'Wall Art',
    ),
    CategoryModel(
      categoryName: 'Furniture',
      subCategoryNames: ['Living Room', 'Bedroom'],
      categoryImage: 'assets/images/furniture.jpeg',
      productName: 'Furniture',
    ),
  ];

  void _zoomIn() {
    setState(() {
      _currentScale += 0.1;
      _transformationController.value = Matrix4.identity()..scale(_currentScale);
    });
  }

  void _zoomOut() {
    setState(() {
      _currentScale -= 0.1;
      _transformationController.value = Matrix4.identity()..scale(_currentScale);
    });
  }

  @override
  void initState() {
    super.initState();

    // Add listener to content scroll controller
    _contentScrollController.addListener(() {
      double offset = _contentScrollController.offset;

      // Calculate the current index based on the scroll position
      int newIndex = (offset / 620).floor();
      if (newIndex != selectedIndex.value) {
        selectedIndex.value = newIndex;
      }
    });
  }

  @override
  void dispose() {
    _sidebarScrollController.dispose();
    _contentScrollController.dispose();
    super.dispose();
  }

  // Scroll content to the selected category
  void scrollToCategory(int index) {
    _contentScrollController.animateTo(
      index * 620.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey.shade300,
        elevation: 1,

        // back button
        leading: IconButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const CircleBorder(side: BorderSide(color: Color(0xffF5F1FE), width: 1)),
            minimumSize: const Size(32, 32),
          ),
          icon: SvgPicture.asset('assets/icons/arrow_left.svg'),
        ),

        title: _globalTextStyles.h1('Categories'),
        titleSpacing: 0,

        actions: [
          // heart icon
          SvgPicture.asset(
            'assets/icons/favorite.svg',
            color: const Color(0xff1F2937),
          ),
          const SizedBox(width: 16),

          // bag icon
          Stack(
            clipBehavior: Clip.none, // Allows the dot to appear outside the bounds if needed
            children: [
              SvgPicture.asset('assets/icons/cart.svg'),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 4,
                  width: 4,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: InteractiveViewer(
        transformationController: _transformationController,
        boundaryMargin: const EdgeInsets.all(0.0),
        child: SizedBox(
          width: 100.w,
          child: Row(
            children: [
              // sidebar
              Container(
                width: 12.h,
                decoration: BoxDecoration(
                  color: const Color(0xffF8F7FE),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, offset: const Offset(1, 0), spreadRadius: 1, blurRadius: 5),
                  ],
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        // categories list
                        Expanded(
                          child: ListView.builder(
                            controller: _sidebarScrollController,
                            itemCount: sideBarCategories.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final category = sideBarCategories[index];

                              return ValueListenableBuilder(
                                valueListenable: selectedIndex,
                                builder: (context, value, child) => CategoryCardSidebar(
                                  categoryImage: category.image,
                                  categoryName: category.name,
                                  isCategorySelected: selectedIndex.value == index,
                                  onTap: () {
                                    setState(() {
                                      selectedCategory = category.name;
                                      selectedIndex.value = index;
                                      scrollToCategory(index);

                                      WidgetsBinding.instance.addPostFrameCallback(
                                        (timeStamp) {
                                          indicatorHeight.value = context.size?.height;
                                        },
                                      );
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),

                    // left border
                    ValueListenableBuilder(
                      valueListenable: selectedIndex,
                      builder: (context, value, child) => CategoryLeftBorder(selectedIndex: value),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14.18),

              // main view
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    // left: 14.18,
                    right: 24.37,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 23.01),
                      Expanded(
                        child: ListView.builder(
                          controller: _contentScrollController,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            var category = categories[index];
                            return CategoryCardMainView(
                              categoryName: category.categoryName,
                              subCategoryNames: category.subCategoryNames,
                              categoryImage: category.categoryImage,
                              productName: category.productName,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // zoom out button
          if (_currentScale > 1)
            IconButton(
              onPressed: _zoomOut,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff8034DA),
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.zoom_out),
            ),

          const SizedBox(width: 5),

          // zoom in button
          IconButton(
            onPressed: _zoomIn,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff8034DA),
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.zoom_in),
          ),
        ],
      ),
    );
  }
}
