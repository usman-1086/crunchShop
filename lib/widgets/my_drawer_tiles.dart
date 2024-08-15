import 'package:flutter/material.dart';


class MyDrawerTiles extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String title;

  const MyDrawerTiles({super.key, required this.onPressed, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: CircleAvatar(backgroundColor: Colors.red ,child: Icon(icon,color: Colors.white,)),
      title: Text(title,style: TextStyle(color: Colors.white,fontSize: 12),),
    );

  }
}
