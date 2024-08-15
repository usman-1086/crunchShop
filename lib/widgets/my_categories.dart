import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cruchshop/utils/app_colors.dart';
import 'package:cruchshop/utils/widht_height.dart';
import 'package:cruchshop/models/categories.dart';

import '../screens/category_screen.dart';

class MyCategories extends StatelessWidget {
  final String title;
  final String image;

  MyCategories({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(title: title,),));
          },
          child: Container(
            padding: EdgeInsets.all(3), // Adjust the thickness of the border here
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey, // Set the border color
                width: 1, // Set the border width
              ),
            ),
            child: CircleAvatar(
              backgroundColor: AppColors.scaffoldColor,
              child: SvgPicture.asset(
                image,
                width: 16,
                height: 16,
              ),
            ),
          ),
        ),
        SizedBox(
          height: WidthHeight(context).height * 0.01,
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class CategoriesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categoryList = CategoryModel.categoryList;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categoryList.map((category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: MyCategories(
              title: category.title,
              image: category.iconPath,
            ),
          );
        }).toList(),
      ),
    );
  }
}
