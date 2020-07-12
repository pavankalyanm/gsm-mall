import 'package:flutter/material.dart';
import 'package:gsm_mall/pages/Product_List_View/product_list_view.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search for Brands & Products',
            hintStyle: TextStyle(fontSize: 12.0),
            suffixIcon: Icon(Icons.search),
            border: InputBorder.none,
            fillColor: Colors.red,
            focusColor: Colors.red,
            hoverColor: Colors.red,
          ),
        ),
        titleSpacing: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductListView()),
              );
            },
            child: Image.asset('assets/search/search_1.jpg'),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0),
                  child: Text(
                    'POPULAR ON STYLE',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.7,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/search/search_2.jpg'),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text(
                    'ROADSTER',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('Tshirts'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductListView()),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/search/search_3.jpg'),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text(
                    'WROGN',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('Tshirts'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductListView()),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/search/search_4.jpg'),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text(
                    'ANOUK',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('Kurtas'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductListView()),
                    );
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
