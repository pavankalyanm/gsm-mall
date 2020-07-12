import 'package:flutter/material.dart';
import 'package:gsm_mall/pages/home/home_main.dart';

// My Own Imports

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  int wishlistItem = 1;

  final wishlistItemList = [
   
    {
      'title': 'Men Slim Fit Casual Shirt',
      'image': 'assets/products/product_11.jpg',
      'price': 390,
      'size': 'M'
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.7;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MY WISHLIST',
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
      body: (wishlistItem == 0)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'WISHLIST EMPTY',
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
                  Container(
                    width: width - 10.0,
                    child: Text(
                      'Save your favorite pieces of clothing in one place. Add now, buy later.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Image.asset(
                    'assets/empty_wishlist.png',
                    height: 120.0,
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
                          'CONTINUE SHOPPING',
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
              itemCount: wishlistItemList.length,
              itemBuilder: (context, index) {
                final item = wishlistItemList[index];
                return Dismissible(
                  key: Key('$item'),
                  onDismissed: (direction) {
                    setState(() {
                      wishlistItemList.removeAt(index);
                      wishlistItem--;
                    });

                    // Then show a snackbar.
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text("Item Removed")));
                  },
                  // Show a red background as the item is swiped away.
                  background: Container(color: Colors.red),
                  child: Container(
                    height: (height / 5.0),
                    child: Card(
                        elevation: 3.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 120.0,
                                  height: ((height - 200.0) / 4.0),
                                  child: Image(
                                    image: AssetImage(item['image']),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              width: (width - 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${item['title']}',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Price:',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        '₹${item['price']}',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(
                                          text: 'Size:  ',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: '  ${item['size']}',
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.blue)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      InkWell(
                                        child: Container(
                                          color: Colors.grey,
                                          padding: EdgeInsets.all(3.0),
                                          child: Text(
                                            'Remove',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            wishlistItemList.removeAt(index);
                                            wishlistItem--;
                                          });

                                          // Then show a snackbar.
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  content:
                                                      Text("Item Removed")));
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                );
              },
            ),
    );
  }
}
