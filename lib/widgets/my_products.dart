import 'dart:convert';

import 'package:cruchshop/screens/product_detail_screen.dart';
import 'package:cruchshop/utils/app_colors.dart';
import 'package:cruchshop/utils/widht_height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cruchshop/models/product_model.dart';

class ProductItem extends StatelessWidget {
  void Function()? onTap;
  final ProductModel product;

  ProductItem({required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                img: product.imageIcon,
                title: product.productTitle,
                price: product.price,
                threeStar: product.threeStar,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.scaffoldColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Stack(
               children : [
                 Container(
                   width: WidthHeight(context).width*0.4,
                   height: WidthHeight(context).height*0.15,
                   color: Color(0XFF141C2F),
                   child: Center(
                     child: Image.asset(
                       product.imageIcon,
                       height: 65,
                       fit: BoxFit.cover,
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(right: 8.0,top: 8),
                   child: Container(
                     alignment: Alignment.topRight,
                     child: (product.Liked),
                   ),
                 )
               ]
              ),
              SizedBox(height: WidthHeight(context).height*0.015),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    product.threeStar,
                    height: 18,
                  ),
                ],
              ),

              SizedBox(height: WidthHeight(context).height*0.01),

              Text(
                product.productTitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
             // SizedBox(height: WidthHeight(context).height*0.01),

              // Display the product price
              Text(
                product.price,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<ProductModel> products = ProductModel.prodcutList;

    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,  // Adjust the aspect ratio of each grid item (optional)
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(
            product: products[index],
          );
        },
      ),
    );
  }
}
