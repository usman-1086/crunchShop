
import 'package:cruchshop/utils/my_images.dart';
import 'package:flutter/material.dart';

class ProductModel{

  final String productTitle;
  final String price;
  final Icon Liked;
  final String imageIcon;
  final String threeStar;
  ProductModel({

    required this.price,
    required this.imageIcon,
    required this.Liked,
    required this.productTitle,
    required this.threeStar
});

  static final List<ProductModel> prodcutList = [
    ProductModel(price: '\$120', imageIcon: MyImages().facebookIcon, Liked:Icon(Icons.favorite,color: Colors.red,) , productTitle: 'Smart Watch', threeStar: MyImages().threeStar ),
    ProductModel(price: '\$1200', imageIcon: MyImages().facebookIcon, Liked: Icon(Icons.favorite, color: Colors.red,), productTitle: 'Apple MacBook',threeStar: MyImages().threeStar ),
    ProductModel(price: '\$220', imageIcon: MyImages().facebookIcon, Liked: Icon(Icons.favorite,color: Colors.red,), productTitle: 'Travelling Bags', threeStar: MyImages().threeStar ),
    ProductModel(price: '\$300', imageIcon: MyImages().facebookIcon, Liked: Icon(Icons.favorite,color: Colors.red,), productTitle: 'New Sports Shoes', threeStar: MyImages().threeStar ),

  ];

}