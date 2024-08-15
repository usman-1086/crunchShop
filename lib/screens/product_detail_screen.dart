import 'package:carousel_slider/carousel_slider.dart';
import 'package:cruchshop/utils/app_colors.dart';
import 'package:cruchshop/utils/widht_height.dart';
import 'package:cruchshop/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailScreen extends StatefulWidget {
  final String img;
  final String title;
  final String threeStar;
  final String price;

  const ProductDetailScreen(
      {super.key,
      required this.img,
      required this.title,
      required this.threeStar,
      required this.price});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      widget.img,
      widget.img,
      widget.img,
    ];

    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.favorite, color: Colors.white),
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Divider(
                color: Colors.grey[800],
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 100.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: true,
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: imgList
                    .map((item) => Container(
                          child: Center(
                            child: Image.asset(item,
                                fit: BoxFit.cover, height: 100, width: 100),
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  imgList.length,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    width: 8.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      color: _currentIndex == index ? Colors.red : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.price,
                    style:
                        TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    widget.threeStar,
                  ),
                  Text(
                    'Available in stock',
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.03,
              ),
              Divider(
                color: Colors.grey[800],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Color Variant',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration:
                        BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: WidthHeight(context).width * 0.03,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: WidthHeight(context).width * 0.03,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration:
                        BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: WidthHeight(context).width * 0.03,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.yellow, shape: BoxShape.circle),
                  ),
                ],
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.03,
              ),
              Divider(
                color: Colors.grey[800],
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.03,
              ),
              
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Brand :',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  Text('Noise',style: TextStyle(color: Colors.grey),)
                ],
              ),
        
              SizedBox(
                height: WidthHeight(context).height * 0.015,
              ),
        
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ModelName :',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  Text('ColorFit Pulse 2',style: TextStyle(color: Colors.grey),)
                ],
              ),

              SizedBox(
                height: WidthHeight(context).height * 0.015,
              ),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Colour :',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  Text('Blue',style: TextStyle(color: Colors.grey),)
                ],
              ),

              SizedBox(
                height: WidthHeight(context).height * 0.015,
              ),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Style :',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  Text('Modern',style: TextStyle(color: Colors.grey),)
                ],
              ),
              
              SizedBox(height: WidthHeight(context).height*0.04,),
              
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Get Free Delivery', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  Text('07 Days Replace', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ],
              ),

              SizedBox(height: WidthHeight(context).height*0.015,),

              Row(
                children: [
                  SizedBox(width: WidthHeight(context).width*0.1,),
                 Icon(Icons.security,color: Colors.red,),
                  SizedBox(width: WidthHeight(context).width*0.55,),
                  Icon(Icons.recycling_sharp,color: Colors.red,)
                ],
              ),

              SizedBox(height: WidthHeight(context).height*0.015,),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Pay on Delivery', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  Text('Warranty Policy', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ],
              ),

              SizedBox(height: WidthHeight(context).height*0.015,),

              Divider(
                color: Colors.grey[800],
              ),

              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('About this item', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                ],
              ),

              SizedBox(height: WidthHeight(context).height*0.01,),

              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: WidthHeight(context).width*0.6,
                    child: Text('asbasdamsnas adasbdkbjaskdbj askbdkasjbdba kjasdkjasbdk kjabsdkjasbda kasjbdkjasbd kbddkjasbkjdbas kasbdkjasbdkjb',style: TextStyle(color: Colors.white),

                    ),
                  ),



                ],
              ),

              SizedBox(height: WidthHeight(context).height*0.03,),

              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: WidthHeight(context).width*0.6,
                    child: Text('adasbdkbjaskdbj askbdkasjbdba kjasdkjasbdk kjabsdkjasbda kasjbdkjasbd kbddkjasbkjdbas kasbdkjasbdkjb',style: TextStyle(color: Colors.white),

                    ),
                  ),
                ],
              ),

              SizedBox(
                height: WidthHeight(context).height*0.02,
              )

            ],
          ),
        ),
      ),

      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyButton(
            width: double.infinity,
            color: Colors.red,
            text: 'Add to Cart',
            onPressed: () {
              // Your onPressed logic
            },
          ),
          SizedBox(height: WidthHeight(context).height*0.02), // Adjust the height as needed
        ],
      ),





    );
  }
}
