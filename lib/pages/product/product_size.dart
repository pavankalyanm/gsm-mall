import 'package:flutter/material.dart';
import 'package:gsm_mall/pages/product/product.dart';
import 'package:page_transition/page_transition.dart';
import 'package:gsm_mall/pages/product/size_chart.dart';

class ProductSize extends StatefulWidget {

  
  @override
  _ProductSizeState createState() => _ProductSizeState();
}

class _ProductSizeState extends State<ProductSize> {
  Color activeColor = Colors.red;
  Color nonActiveColor = Colors.grey[100];
  bool xsSize = false, sSize = false, mSize = false, lSize = false;
  bool blackColor = false, redColor = false, blueColor = false;
  Color activeColorBorder = Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    String s='L';
    Passproductsize product=new Passproductsize('L');

    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'SIZE',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Jost',
                  letterSpacing: 0.7,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: SizeChart()));
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: 5.0, bottom: 5.0, right: 10.0, left: 10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Text(
                    'SIZE CHART',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Jost',
                      letterSpacing: 0.7,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 5.0,),
          Text(
            'Tip: For the best fit, buy one size larger than your usual size.',
            style: TextStyle(fontSize: 12.0),
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                child: Container(
                  width: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: (!xsSize) ? nonActiveColor : activeColor),
                    borderRadius: BorderRadius.circular(10.0),
                    color: (!xsSize) ? Colors.white : activeColor,
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'XS',
                    style: TextStyle(
                        color: (!xsSize) ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (!xsSize) {
                      Product product=new Product('XS');
                      ProductPage(productsize:Passproductsize(product.size) ,);
                      xsSize = true;
                      sSize = false;
                      mSize = false;
                      lSize = false;
                    } else {
                      xsSize = false;
                    }
                  });
                },
              ),
              InkWell(
                child: Container(
                  width: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: (!sSize) ? nonActiveColor : activeColor),
                    borderRadius: BorderRadius.circular(10.0),
                    color: (!sSize) ? Colors.white : activeColor,
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'S',
                    style: TextStyle(
                        color: (!sSize) ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (!sSize) {
                      s="S";
                      Product product=new Product('S');
                      ProductPage(productsize:Passproductsize(s) ,);
                      sSize = true;
                      xsSize = false;
                      mSize = false;
                      lSize = false;
                    } else {
                      sSize = false;
                    }
                  });
                },
              ),
              InkWell(
                child: Container(
                  width: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: (!mSize) ? nonActiveColor : activeColor),
                    borderRadius: BorderRadius.circular(10.0),
                    color: (!mSize) ? Colors.white : activeColor,
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'M',
                    style: TextStyle(
                        color: (!mSize) ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (!mSize) {
                      Product product=new Product('M');

                      ProductPage(productsize:Passproductsize(product.size) ,);
                      mSize = true;
                      xsSize = false;
                      sSize = false;
                      lSize = false;
                    } else {
                      mSize = false;
                    }
                  });
                },
              ),
              InkWell(
                child: Container(
                  width: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: (!lSize) ? nonActiveColor : activeColor),
                    borderRadius: BorderRadius.circular(10.0),
                    color: (!lSize) ? Colors.white : activeColor,
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'L',
                    style: TextStyle(
                        color: (!lSize) ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (!lSize) {
                     // Passproductsize product=new Passproductsize('L');
                     product.pdtsize='l';

                      new ProductPage(productsiz:s ,);
                    //  print(Passproductsize('l'));
                      lSize = true;
                      xsSize = false;
                      sSize = false;
                      mSize = false;
                    } else {
                      lSize = false;
                    }
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Divider(height: 1.0),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'COLOR',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Jost',
              letterSpacing: 0.7,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: (!blackColor)
                              ? Colors.transparent
                              : activeColorBorder,
                          width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.black,
                    ),
                    child: (!blackColor)
                        ? Container()
                        : Container(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  onTap: () {
                    setState(() {
                      if (!blackColor) {
                        blackColor = true;
                        redColor = false;
                        blueColor = false;
                      } else {
                        blackColor = false;
                      }
                    });
                  },
                ),
                InkWell(
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: (!redColor)
                              ? Colors.transparent
                              : activeColorBorder,
                          width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.red,
                    ),
                    child: (!redColor)
                        ? Container()
                        : Container(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  onTap: () {
                    setState(() {
                      if (!redColor) {
                        redColor = true;
                        blackColor = false;
                        blueColor = false;
                      } else {
                        redColor = false;
                      }
                    });
                  },
                ),
                InkWell(
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: (!blueColor)
                              ? Colors.transparent
                              : activeColorBorder,
                          width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.blue,
                    ),
                    child: (!blueColor)
                        ? Container()
                        : Container(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  onTap: () {
                    setState(() {
                      if (!blueColor) {
                        blueColor = true;
                        redColor = false;
                        blackColor = false;
                      } else {
                        blueColor = false;
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Product{
String size;

  Product(String size){
    this.size=size;
  }
  
}

class Passproductsize {
   String size;

  Passproductsize(String size){
    this.size=size;
  }
  String get pdtsize {
      return size; 
   } 
    
   void set pdtsize(String size) {
      this.size = size;
   }
}