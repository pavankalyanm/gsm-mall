import 'package:flutter/material.dart';
import 'package:gsm_mall/pages/Category/category_main.dart';

class TopCategoryGrid extends StatelessWidget {
  final topCategoryList = [
    {'title': 'Masks', 'image': 'assets/top_category/top_category_1.jpg'},
    {'title': 'Lounge Wear', 'image': 'assets/top_category/top_category_2.jpg'},
    {'title': 'Kurtas', 'image': 'assets/top_category/top_category_3.jpg'},
   
    {'title': 'Dresses', 'image': 'assets/top_category/top_category_5.jpg'},
    {'title': 'Tops', 'image': 'assets/top_category/top_category_6.jpg'},
    
    {'title': 'Flip-Flops', 'image': 'assets/top_category/top_category_8.jpg'},
    
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
            MaterialPageRoute(builder: (context) => CategoryMain()),
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
            'TOP CATEGORIES',
            style: TextStyle(
                fontFamily: 'Jost',
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontSize: 15.0),
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
                children: List.generate(topCategoryList.length, (index) {
                  return getStructuredGridCell(topCategoryList[index]);
                }),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}
