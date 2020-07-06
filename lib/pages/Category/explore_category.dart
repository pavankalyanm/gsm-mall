import 'package:flutter/material.dart';
import 'package:gsm_mall/pages/Product_List_View/product_list_view.dart';

class ExploreCategory extends StatelessWidget {
  final categoryList = [
    {'title': 'Masks', 'image': 'assets/category_explore_category/category_explore_category_1.jpg'},
    {'title': 'Men\'s T-Shirts', 'image': 'assets/category_explore_category/category_explore_category_2.jpg'},
    {'title': 'Men\'s Jeans', 'image': 'assets/category_explore_category/category_explore_category_3.jpg'},
    {'title': 'Casual Shirts', 'image': 'assets/category_explore_category/category_explore_category_4.jpg'},
    {'title': 'Casual Trousers', 'image': 'assets/category_explore_category/category_explore_category_5.jpg'},
    {'title': 'Activewear', 'image': 'assets/category_explore_category/category_explore_category_6.jpg'}
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
            'EXPLORE CATEGORY',
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
                children: List.generate(categoryList.length, (index) {
                  return getStructuredGridCell(categoryList[index]);
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
