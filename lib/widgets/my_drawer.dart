import 'package:cruchshop/utils/app_colors.dart';
import 'package:cruchshop/utils/my_images.dart';
import 'package:cruchshop/utils/widht_height.dart';
import 'package:cruchshop/widgets/my_drawer_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: WidthHeight(context).width*0.7,
      backgroundColor: AppColors.scaffoldColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(height: WidthHeight(context).height*0.08,),

            SvgPicture.asset(MyImages().appIcon,height: 64,width: 64,),

            SizedBox(height: WidthHeight(context).height*0.03,),

            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Crunch',
                    style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Shop',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),


            Divider(
              color: Colors.grey,
            ),
            
            MyDrawerTiles(onPressed: (){

            }, icon:Icons.card_giftcard , title: 'Reward'),
            MyDrawerTiles(onPressed: (){

            }, icon:Icons.person , title: 'Help'),
            MyDrawerTiles(onPressed: (){

            }, icon: Icons.question_mark, title: 'Contact Us'),
            MyDrawerTiles(onPressed: (){

            }, icon: Icons.security, title: 'Privacy Policy'),
            MyDrawerTiles(onPressed: (){

            }, icon: Icons.logout_outlined, title: 'Logout'),


          ],
        ),
      ),
    );
  }
}
