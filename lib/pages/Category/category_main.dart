import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:gsm_mall/pages/Category/category_page_slider.dart';
import 'package:gsm_mall/pages/Category/explore_category.dart';
import 'package:gsm_mall/pages/Category/in_the_spotlight.dart';
import 'package:gsm_mall/pages/cart.dart';
import 'package:gsm_mall/pages/home/home_component/explore_brands.dart';
import 'package:gsm_mall/pages/home/home_component/kids_apparels.dart';
import 'package:gsm_mall/pages/home/home_component/safety_checklist.dart';
import 'package:gsm_mall/pages/wishlist.dart';

class CategoryMain extends StatefulWidget {
  @override
  _CategoryMainState createState() => _CategoryMainState();
}

class _CategoryMainState extends State<CategoryMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GSM MALL',
          style: TextStyle(
            fontFamily: 'Jost',
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            letterSpacing: 1.7,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,),
            onPressed: (){}
          ),

          IconButton(
            icon: Badge(
              badgeContent: Text('0', style: TextStyle(color: Colors.white),),
              badgeColor: Theme.of(context).primaryColorLight,
              child: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WishlistPage()),
              );
            },
          ),

          IconButton(
            icon: Badge(
              badgeContent: Text('0', style: TextStyle(color: Colors.white),),
              badgeColor: Theme.of(context).primaryColorLight,
              child: Icon(FontAwesomeIcons.shoppingBag, color: Colors.black,),
            ),
            onPressed: () {
              Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: CartPage()));
            },
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[

          // Safety Checklist Start
         
          // Safety Checklist End

          // Slider Start
          CategoryPageSlider(),
          // Slider End

          // Explore Category Start
          ExploreCategory(),
          // Explore Category End

          SizedBox(height: 8.0,),

          // In The Spotlight Start
          InTheSpotlight(),
          // In The Spotlight End

          SizedBox(height: 8.0,),

          // Explore Brands Start
          ExploreBrands(),
          // Explore Brands End

          SizedBox(height: 8.0,),

          // Kids Apparels Start
          KidsApparels(),
          // Kids Apparels End

          SizedBox(height: 8.0,),

        ],
      ),
    );
  }
}
