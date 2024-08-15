import 'package:cruchshop/utils/app_colors.dart';
import 'package:cruchshop/utils/widht_height.dart';
import 'package:cruchshop/widgets/my_products.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final String title;
  const CategoryScreen({super.key, required this.title});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
       appBar:  AppBar(
          backgroundColor: AppColors.scaffoldColor,
          title: Text(widget.title,style: TextStyle(color: Colors.white),),
          centerTitle: true,
         iconTheme: IconThemeData(
           color: Colors.white
         ),
       ),
      body: Column(
        children: [

          Divider(
            color: Colors.grey[800],
          ),


          ProductGrid()
        ],
      )
    );
  }
}
