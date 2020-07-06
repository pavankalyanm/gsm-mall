import 'package:flutter/material.dart';
import 'package:gsm_mall/pages/Product_List_View/product_list_view.dart';

class InTheSpotlight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'IN THE SPOTLIGHT',
            style: TextStyle(
                fontFamily: 'Jost',
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontSize: 15.0),
          ),
        ),
        Container(
          height: 300.0,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1.0,
                      blurRadius: 1.0, // changes position of shadow
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductListView()),
                    );
                  },
                  child: Image(
                      image: AssetImage(
                          'assets/in_the_spotlight/in_the_spotlight_1.jpg')),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1.0,
                      blurRadius: 1.0, // changes position of shadow
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductListView()),
                    );
                  },
                  child: Image(
                      image: AssetImage(
                          'assets/in_the_spotlight/in_the_spotlight_2.jpg')),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
