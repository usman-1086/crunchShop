import 'package:cruchshop/utils/app_colors.dart';
import 'package:cruchshop/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

import '../utils/widht_height.dart';
import '../widgets/my_categories.dart';
import '../widgets/my_products.dart';
import '../widgets/my_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  final PageController _pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          _buildHomePage(), // Default Home Page
          _buildLikePage(),
          _buildShopPage(),
          _buildUserPage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color with opacity
              spreadRadius: 5,
              blurRadius: 10, // Blur radius for a softer shadow
              offset: Offset(0, -5), // Shift the shadow upwards
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomePage() {
    return
        Scaffold(
          backgroundColor: AppColors.scaffoldColor,
          appBar: AppBar(
            title: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Crunch',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Shop',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: AppColors.scaffoldColor,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: CircleAvatar(
                    radius: 30,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.person,
                          size: 24,
                        ))),
              )
            ],
          ),

           drawer: MyDrawer(),

           body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: WidthHeight(context).height * 0.03,
                  ),
                  MyTextfield(
                    controller: _searchController,
                    hint: 'Search "Smartphones" ',
                  ),
                  SizedBox(
                    height: WidthHeight(context).height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Shop by category',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: WidthHeight(context).height * 0.03,
                  ),
                  CategoriesRow(),
                  SizedBox(
                    height: WidthHeight(context).height * 0.06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Newest arrival',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: WidthHeight(context).height * 0.04,
                  ),
                  ProductGrid(),
                ],
              ),
            )

    );



  }

  Widget _buildLikePage() {
    return Center(
      child: Text(
        'Like Page',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildShopPage() {
    return Center(
      child: Text(
        'Shop Page',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildUserPage() {
    return Center(
      child: Text(
        'User Page',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
