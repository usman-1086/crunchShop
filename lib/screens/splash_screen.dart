import 'dart:async';
import 'package:cruchshop/screens/welcome_screen.dart';
import 'package:cruchshop/utils/app_colors.dart';
import 'package:cruchshop/utils/my_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/widht_height.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(MyImages().appIcon,height: 150,width: 150,),

            SizedBox(height: WidthHeight(context).height*0.03,),

            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Crunch',
                    style: TextStyle(color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Shop',
                    style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),          ],
        ),
      ),
    );
  }
}
