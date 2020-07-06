import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async' show Future, Timer;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_spinkit/flutter_spinkit.dart';

// My Own Imports
import 'package:gsm_mall/pages/Product_List_View/filter_row.dart';
import 'package:gsm_mall/pages/product/product.dart';

class GetProducts extends StatefulWidget {
  @override
  _GetProductsState createState() => _GetProductsState();
}

class _GetProductsState extends State<GetProducts> {
  bool loading = true, all = true, men = false, women = false;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        loading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String selected;

    (all) ? selected = 'all' : (men) ? selected = 'men' : selected = 'women';

    return (loading)
        ? Center(
            child: SpinKitRipple(color: Colors.red),
          )
        : FutureBuilder<List<Products>>(
            future: loadProducts(selected),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  _changeSelected('all');
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 5.0,
                                      bottom: 5.0,
                                      right: 10.0,
                                      left: 10.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: (all)
                                        ? Border.all(color: Colors.red)
                                        : Border.all(color: Colors.grey),
                                  ),
                                  child: Text(
                                    'ALL',
                                    style: TextStyle(
                                      fontFamily: 'Jost',
                                      fontWeight: (all)
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontSize: 15.0,
                                      letterSpacing: 1.5,
                                      color: (all) ? Colors.red : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              InkWell(
                                onTap: () {
                                  _changeSelected('men');
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 5.0,
                                      bottom: 5.0,
                                      right: 10.0,
                                      left: 10.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: (men)
                                        ? Border.all(color: Colors.red)
                                        : Border.all(color: Colors.grey),
                                  ),
                                  child: Text(
                                    'MENS',
                                    style: TextStyle(
                                      fontFamily: 'Jost',
                                      fontWeight: (men)
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontSize: 15.0,
                                      letterSpacing: 1.5,
                                      color: (men) ? Colors.red : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              InkWell(
                                onTap: () {
                                  _changeSelected('women');
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 5.0,
                                      bottom: 5.0,
                                      right: 10.0,
                                      left: 10.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: (women)
                                        ? Border.all(color: Colors.red)
                                        : Border.all(color: Colors.grey),
                                  ),
                                  child: Text(
                                    'WOMENS',
                                    style: TextStyle(
                                      fontFamily: 'Jost',
                                      fontWeight: (women)
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontSize: 15.0,
                                      letterSpacing: 1.5,
                                      color:
                                          (women) ? Colors.red : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        FilterRow(),
                        Divider(
                          height: 1.0,
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: ProductsGridView(products: snapshot.data)),
                      ],
                    )
                  : Center(
                      child: SpinKitRipple(color: Colors.red),
                    );
            },
          );
  }

  _changeSelected(String value) {
    setState(() {
      loading = true;
    });
    if (value == 'all') {
      Timer(const Duration(milliseconds: 500), () {
        setState(() {
          all = true;
          men = false;
          women = false;
          loading = false;
        });
      });
    }

    if (value == 'men') {
      Timer(const Duration(milliseconds: 500), () {
        setState(() {
          all = false;
          men = true;
          women = false;
          loading = false;
        });
      });
    }

    if (value == 'women') {
      Timer(const Duration(milliseconds: 500), () {
        setState(() {
          all = false;
          men = false;
          women = true;
          loading = false;
        });
      });
    }
  }
}

class ProductsGridView extends StatefulWidget {
  final List<Products> products;

  ProductsGridView({Key key, this.products}) : super(key: key);

  @override
  _ProductsGridViewState createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  InkWell getStructuredGridCell(Products products) {
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      child: Container(
        //margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 1.5,
              color: Colors.grey,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Hero(
              tag: Text("${products.uniqueId}"),
              child: Container(
                // height: 185.0,
                height: ((height - 150.0) / 2.95),
                margin: EdgeInsets.all(6.0),
                child: Image(
                  image: AssetImage(products.productImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 6.0, left: 6.0),
              child: Column(
                children: <Widget>[
                  Text(
                    products.productTitle,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Jost',
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "\₹${products.productPrice}",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        "\₹${products.productOldPrice}",
                        style: TextStyle(
                            fontSize: 13.0,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        "(${products.offerText})",
                        style: TextStyle(
                            color: const Color(0xFF67A86B), fontSize: 14.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(
              productData: PassDataToProduct(
                  products.productId,
                  products.productImage,
                  products.productTitle,
                  products.productPrice,
                  products.productOldPrice,
                  products.offerText,
                  products.uniqueId),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 2,
      childAspectRatio: ((width) / (height - 190.0)),
      children: List.generate(widget.products.length, (index) {
        return getStructuredGridCell(widget.products[index]);
      }),
    );
  }
}

class Products {
  int productId;
  String productImage;
  String productTitle;
  String productPrice;
  String productOldPrice;
  String offerText;
  final String uniqueId;

  Products(this.productId, this.productImage, this.productTitle,
      this.productPrice, this.productOldPrice, this.offerText, this.uniqueId);
}

Future<List<Products>> loadProducts(selected) async {
  if (selected == 'all') {
    var jsonString = await rootBundle.loadString('assets/json/products.json');
    final jsonResponse = json.decode(jsonString);

    List<Products> products = [];

    for (var o in jsonResponse) {
      Products product = Products(o["productId"], o["productImage"],
          o["productTitle"], o["price"], o["oldPrice"], o["offer"], o["uniqueId"]);

      products.add(product);
    }

    return products;
  } else if (selected == 'men') {
    var jsonString =
        await rootBundle.loadString('assets/json/men_products.json');
    final jsonResponse = json.decode(jsonString);

    List<Products> products = [];

    for (var o in jsonResponse) {
      Products product = Products(o["productId"], o["productImage"],
          o["productTitle"], o["price"], o["oldPrice"], o["offer"], o["uniqueId"]);

      products.add(product);
    }

    return products;
  } else {
    var jsonString =
        await rootBundle.loadString('assets/json/women_products.json');
    final jsonResponse = json.decode(jsonString);

    List<Products> products = [];

    for (var o in jsonResponse) {
      Products product = Products(o["productId"], o["productImage"],
          o["productTitle"], o["price"], o["oldPrice"], o["offer"], o["uniqueId"]);

      products.add(product);
    }

    return products;
  }
}

class PassDataToProduct {
  final String title;
  final int productId;
  final String imagePath;
  final String price;
  final String oldPrice;
  final String offer;
  final String uniqueId;

  PassDataToProduct(this.productId, this.imagePath, this.title, this.price,
      this.oldPrice, this.offer, this.uniqueId);
}
