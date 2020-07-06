import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gsm_mall/pages/Category/category_main.dart';

class CategorySlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: 116.0,
      child: Container(
        margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 5.0),
            InkWell(
              child: Image(
                image: AssetImage(
                  'assets/men_category.jpg',
                ),
                fit: BoxFit.fitHeight,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryMain()),
                );
              },
            ),
            SizedBox(width: 5.0),
            InkWell(
              child: Image(
                image: AssetImage(
                  'assets/women_category.jpg',
                ),
                fit: BoxFit.fitHeight,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryMain()),
                );
              },
            ),
            SizedBox(width: 5.0),
           
            InkWell(
              child: Image(
                image: AssetImage(
                  'assets/kids_category.jpg',
                ),
                fit: BoxFit.fitHeight,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryMain()),
                );
              },
            ),
           
           
            SizedBox(width: 5.0),
          ],
        ),
      ),
    );
  }
}
