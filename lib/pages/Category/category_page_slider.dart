import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gsm_mall/pages/Product_List_View/product_list_view.dart';

class CategoryPageSlider extends StatefulWidget {
  @override
  _CategoryPageSliderState createState() => _CategoryPageSliderState();
}

class _CategoryPageSliderState extends State<CategoryPageSlider> {
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
                    MaterialPageRoute(builder: (context) => ProductListView()),
                  );
                },
                child: Image(
                  image: AssetImage(
                      'assets/category_page_slider/category_page_slider_1.jpg'),
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => TopOffers(title: '${item['title']}')),
                  // );
                },
                child: Image(
                  image: AssetImage(
                      'assets/category_page_slider/category_page_slider_2.jpg'),
                ),
              ),
            ],
            autoPlay: true,
            aspectRatio: 16 / 9,
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
