

import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:gsm_mall/pages/Product_List_View/get_products.dart';
import 'package:gsm_mall/pages/cart.dart';
import 'package:gsm_mall/pages/order_payment/delivery_address.dart';
import 'package:gsm_mall/pages/product/product_details.dart';
import 'package:gsm_mall/pages/wishlist.dart';
import 'package:gsm_mall/models/cartmodel.dart';
import 'package:provider/provider.dart';
import 'package:gsm_mall/pages/product/product_size.dart';
// My Own Imports


class ProductPage extends StatefulWidget {



 
  final PassDataToProduct productData;
  final Passproductsize productsize;

  ProductPage({Key key, this.productData,this.productsize,this.productsiz}) : super(key: key);
  
  final String productsiz;

  //ProductPage({Key key, this.productsize}) : super(key: key);


  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  //Passproductsize s=new Passproductsize();

  bool isButtonPressed = false;
  
  bool favourite = false;
  int cartItem = 0;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    double width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.productData.title,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Jost',
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        titleSpacing: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            
              icon: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
       
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WishlistPage()),
              );
            },
          ),
          IconButton(
           
             icon: Icon(
                FontAwesomeIcons.shoppingBag,
                color: Colors.black,
              ),
         
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft, child: CartPage()));
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF1F3F6),
      body: ProductDetails(data: widget.productData),
      bottomNavigationBar: Material(
        elevation: 5.0,
        child: Container(
          color: Colors.white,
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
             ButtonTheme(
                minWidth: ((width) / 2),
                height: 50.0,
                child: RaisedButton(
                  child:  Text(
                    'ADD TO BAG',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontFamily: 'Jost',
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   color:  Colors.white ,
                  onPressed: () {

                  //  _productsizeBottomSheet(context);
                    setState(() {
                      // print(widget.productsiz);
                      cartItem++;
                      cart.addItem(widget.productData.productId.toString(),widget.productData.title,widget.productData.imagePath,widget.productData.price,widget.productData.offer,widget.productData.oldPrice,'L');
                      if(exist().isexist!=true){
                       cart.removeSingleItem(widget.productData.productId.toString());
                        showAlertDialog(context);
                      }
                     
                    });
                  }
                 
                )
               
             

              ),
              
               

   

              ButtonTheme(
                // minWidth: ((width - 60.0) / 2),
                minWidth: ((width) / 2),
                height: 50.0,
                child: RaisedButton(
                  child: Text(
                    'GO TO BAG',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontFamily: 'Jost',
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    //print(widget.productsize.size);
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: CartPage()));
                  },
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void showAlertDialog(BuildContext context){
    showDialog<void>(context: context,
    barrierDismissible: false,
    builder: (BuildContext context){
      return AlertDialog(
        title: Text("Item added in Cart"),
        content: Text("GO TO BAG"),
        actions: <Widget>[
          FlatButton(
            child: Text("OK"),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
    
    );
  }
}

class exist{
  bool isexist;

  exist({ this.isexist});
}

/*void _productsizeBottomSheet(context) {
  showModalBottomSheet( context: context,
      builder: (BuildContext bc) {


        Color activeColor = Colors.red;
        Color nonActiveColor = Colors.grey[100];
        bool xsSize = false, sSize = false, mSize = false, lSize = false;
        bool blackColor = false, redColor = false, blueColor = false;
        Color activeColorBorder = Colors.redAccent;

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

                ],
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

                        if (!sSize) {
                       //   s="S";
                         // Product product=new Product('S');
                        //  ProductPage(productsize:Passproductsize(s) ,);
                          sSize = true;
                          xsSize = false;
                          mSize = false;
                          lSize = false;
                        } else {
                          sSize = false;
                        }

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

                        if (!lSize) {
                          // Passproductsize product=new Passproductsize('L');
                         // product.pdtsize='l';
                        //  print(product.size);
                        //  ProductPage(productsize:Passproductsize(product.pdtsize) ,);
                          print(Passproductsize('l'));
                          lSize = true;
                          xsSize = false;
                          sSize = false;
                          mSize = false;
                        } else {
                          lSize = false;
                        }

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
                          if (!blackColor) {
                            blackColor = true;
                            redColor = false;
                            blueColor = false;
                          } else {
                            blackColor = false;
                          }

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
                         {
                          if (!redColor) {
                            redColor = true;
                            blackColor = false;
                            blueColor = false;
                          } else {
                            redColor = false;
                          }
                        }
                      },
                    ),
                    FlatButton(
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
                      onPressed: () {

                          if (!blueColor) {
                            blueColor = true;
                            redColor = false;
                            blackColor = false;
                          } else {
                            blueColor = false;
                          }

                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

  });
}*/