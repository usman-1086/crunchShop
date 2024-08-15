import 'dart:async';
import 'package:cruchshop/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cruchshop/utils/app_colors.dart';
import 'package:cruchshop/utils/my_images.dart';
import 'package:cruchshop/utils/widht_height.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, String>> _pages = [
    {'image': MyImages().welcome1, 'text': 'Get Fast Local Delivery', 'subtitles': 'We express offers cash on delivery services and fast delivery services'},
    {'image': MyImages().welcome2, 'text': 'Discover new products', 'subtitles': 'Many new products are discovered by people simply happening upon them while being out'},
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _pages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldColor,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
            },
            child: Text('Skip', style:TextStyle(color: Colors.red)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(height: WidthHeight(context).height*0.1,),
                    SvgPicture.asset(
                      _pages[index]['image']!,
                      width: WidthHeight(context).width * 0.3,
                      height: WidthHeight(context).height * 0.3,
                    ),
                    SizedBox(height: WidthHeight(context).height*0.1,),
                    Text(
                      _pages[index]['text']!,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                    SizedBox(height: WidthHeight(context).height*0.07,),
                    Text(
                      textAlign: TextAlign.center,
                      _pages[index]['subtitles']!,
                      style: TextStyle(fontSize: 14,),
                    ),
                  ],
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pages.length,
                        (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.red
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
