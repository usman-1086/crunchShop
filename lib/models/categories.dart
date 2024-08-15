import '../utils/my_images.dart';

class CategoryModel {
  final String title;
  final String iconPath;

  CategoryModel({
    required this.title,
    required this.iconPath,
  });

  static final List<CategoryModel> categoryList = [
    CategoryModel(title: 'Clothes', iconPath: MyImages().clothesIcon),
    CategoryModel(title: 'Bag', iconPath: MyImages().bagIcon),
    CategoryModel(title: 'Shoes', iconPath: MyImages().clothesIcon),
    CategoryModel(title: 'Kitchen', iconPath: MyImages().kitchenIcon),
    CategoryModel(title: 'Mobiles', iconPath: MyImages().googlesIcon),
    CategoryModel(title: 'Toys', iconPath: MyImages().kitchenIcon),
    CategoryModel(title: 'Googles', iconPath: MyImages().googlesIcon),
    CategoryModel(title: 'Kitchen', iconPath: MyImages().kitchenIcon),
  ];
}
