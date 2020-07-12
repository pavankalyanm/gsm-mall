import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final cartItemList = [
  
    
    {
      'status': 3,
      'title': 'Solid Shirt Style Top',
      'image': 'assets/products/product_17.jpg',
      'price': 30,
      'size': 'L'
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.7;
    double height = MediaQuery.of(context).size.height;

    Container _checkStatus(status) {
      // status 1 => Out for Delivery
      // status 2 => Shipped
      // status 3 => Delivered

      if (status == 1) {
        return Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(topRight: Radius.circular(5.0)),
          ),
          child: Text(
            'Out for Delivery',
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        );
      } else if (status == 2) {
        return Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.only(topRight: Radius.circular(5.0)),
          ),
          child: Text(
            'Shipped',
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        );
      } else {
        return Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(topRight: Radius.circular(5.0)),
          ),
          child: Text(
            'Delivered',
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'MY ORDERS',
          style: TextStyle(
            fontFamily: 'Jost',
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            letterSpacing: 1.7,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
          itemCount: cartItemList.length,
          itemBuilder: (context, index) {
            final item = cartItemList[index];
            return Container(
              // height: (height / 4.5),
              child: Card(
                  elevation: 5.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        right: 0,
                        child: _checkStatus(item['status']),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: (height/40.0), bottom: (height/40.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
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
                                      alignment: Alignment.center,
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
                                            '\Rs.${item['price']}',
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
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
