import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gsm_mall/pages/Product_List_View/product_list_view.dart';

class MainSlider extends StatefulWidget {
  @override
  _MainSliderState createState() => _MainSliderState();
}

class _MainSliderState extends State<MainSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 305.0,
      padding: EdgeInsets.only(bottom: 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          CarouselSlider(
            height: 270.0,
            enlargeCenterPage: true,
            items: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductListView()),
                  );
                },
                child: Image(
                  image: AssetImage('assets/home_slider/slider_1.jpg'),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductListView()),
                  );
                },
                child: Image(
                  image: AssetImage('assets/home_slider/slider_2.jpg'),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductListView()),
                  );
                },
                child: Image(
                  image: AssetImage('assets/home_slider/slider_3.jpg'),
                ),
              ),
            ],
            autoPlay: true,
            aspectRatio: 16/9,
            autoPlayInterval: const Duration(seconds: 6),
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,

          ),
        ],
      ),
    );
  }
}
