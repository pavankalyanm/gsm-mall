import 'package:flutter/material.dart';
import 'package:gsm_mall/pages/Product_List_View/product_list_view.dart';

class ExploreBrands extends StatelessWidget {
  final brandList = [
    {'title': 'Levi\'s', 'image': 'assets/explore_brands/explore_brands_1.jpg'},
    {'title': 'JBL', 'image': 'assets/explore_brands/explore_brands_2.jpg'},
    {'title': 'Nike', 'image': 'assets/explore_brands/explore_brands_3.jpg'},
    {'title': 'United Colors', 'image': 'assets/explore_brands/explore_brands_4.jpg'},
    {'title': 'Phillips', 'image': 'assets/explore_brands/explore_brands_5.jpg'},
    {'title': 'HRX', 'image': 'assets/explore_brands/explore_brands_6.jpg'},
    {'title': 'Dressberry', 'image': 'assets/explore_brands/explore_brands_7.jpg'},
    {'title': 'The Roadster', 'image': 'assets/explore_brands/explore_brands_8.jpg'},
    {
      'title': 'U.S. Polo ASSN.',
      'image': 'assets/explore_brands/explore_brands_9.jpg'
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    InkWell getStructuredGridCell(bestOffer) {
      final item = bestOffer;
      return InkWell(
        child: Image(
          image: AssetImage(item['image']),
          fit: BoxFit.fill,
        ),
        onTap: () {
          Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductListView()),
                  );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'EXPLORE BRANDS',
            style: TextStyle(
              fontFamily: 'Jost',
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              fontSize: 15.0
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0.0),
              alignment: Alignment.center,
              width: width - 20.0,
              child: GridView.count(
                primary: false,
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                crossAxisCount: 3,
                childAspectRatio: ((width) / 500),
                children: List.generate(brandList.length, (index) {
                  return getStructuredGridCell(brandList[index]);
                }),
              ),
            ),
          ],
        ),

        SizedBox(height: 10.0,)
      ],
    );
  }
}
