import 'package:flutter/material.dart';
import 'package:gsm_mall/models/cartmodel.dart';
import 'package:gsm_mall/widgets/cartitem.dart';
import 'package:page_transition/page_transition.dart';

// My Own Imports
import 'package:gsm_mall/pages/home/home_main.dart';
import 'package:gsm_mall/pages/order_payment/delivery_address.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool enable = true;
  int cartItem = 0;
  int cartTotal = 0;

 /* final cartItemList = [
    {
      'title': 'Ruffled Shirt Style Top',
      'image': 'assets/products/product_20.jpg',
      'price': 59,
      'size': 'L'
    },
    {
      'title': 'Men Slim Fit Casual Shirt',
      'image': 'assets/products/product_2.jpg',
      'price': 25,
      'size': 'M'
    },
    {
      'title': 'Solid Shirt Style Top',
      'image': 'assets/products/product_17.jpg',
      'price': 30,
      'size': 'L'
    },
    
  ];*/

  @override
  Widget build(BuildContext context) {
   
   final cart = Provider.of<Cart>(context);

    double width = MediaQuery.of(context).size.width * 0.7;
    double widthFull = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // No Item in Cart AlertDialog Start Here
    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text(
              "Alert",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text("No Item in Bag"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              FlatButton(
                child: Text(
                  "Close",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    // No Item in Cart AlertDialog Ends Here

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MY BAG',
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
      ),
      bottomNavigationBar: Material(
        elevation: 5.0,
        child: Container(
          color: Colors.white,
          width: widthFull,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: ((widthFull) / 2),
                height: 50.0,
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: 'TOTAL: ',
                    style: TextStyle(
                        fontFamily: 'Jost',
                        letterSpacing: 0.7,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                        color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' \Rs.${cart.totalAmount}',
                        style: TextStyle(
                          fontFamily: 'Jost',
                          letterSpacing: 0.7,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ButtonTheme(
                minWidth: ((widthFull) / 2),
                height: 50.0,
                child: RaisedButton(
                  child: Text(
                    'CHECKOUT',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.7,
                      fontSize: 15.0,
                    ),
                  ),
                  onPressed: () {
                    (cart.items.length == 0)
                        ? _showDialog()
                        : Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: Delivery()));
                  },
                  color: (cart.items.length == 0) ? Colors.grey : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
      body: (cart.items.length == 0)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                 
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Hey, it feels so light!',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.7,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'There is nothing in your bag. Let\'s add some items.',
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeMain()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.red),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 10.0, right: 15.0, left: 15.0),
                        child: Text(
                          'ADD ITEMS TO BAG',
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Jost',
                            fontSize: 16.0,
                            letterSpacing: 0.8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
           : ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) =>Cartpdt(
                    cart.items.values.toList()[index].id,
                    cart.items.keys.toList()[index],
                    cart.items.values.toList()[index].name,
                    cart.items.values.toList()[index].imagepath,
                    cart.items.values.toList()[index].price,
                    cart.items.values.toList()[index].quantity,
                    cart.items.values.toList()[index].offer,
                    cart.items.values.toList()[index].oldprice,
                    cart.items.values.toList()[index].size,
                    
                    )
                  ),
    );
  }
}
