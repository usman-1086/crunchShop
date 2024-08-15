import 'package:flutter/cupertino.dart';

class WidthHeight {
  final double width;
  final double height;

  WidthHeight(BuildContext context)
      : width = MediaQuery.of(context).size.width,
        height = MediaQuery.of(context).size.height;
}
