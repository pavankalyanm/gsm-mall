import 'package:flutter/material.dart';
import 'package:gsm_mall/models/cartmodel.dart';
import 'package:provider/provider.dart';
import 'package:gsm_mall/pages/product/product.dart';

class Cartpdt extends StatefulWidget {
  final String id;
  final String productId;
  final int price;
  final int quantity;
  final String name;
  final String imagepath;
  final String offer;
  final String oldprice;
  final String size;

  Cartpdt( this.id,this.productId,this.name,this.imagepath, this.price, this.quantity,this.offer,this.oldprice,this.size);

  @override
  _CartpdtState createState() => _CartpdtState();
}

class _CartpdtState extends State<Cartpdt> {
  //final cart = Provider.of<Cart>(context);
  int _itemCount = 1;

 //var cartItemList = {..._items};

  @override
  Widget build(BuildContext context) {

    //final cart = Provider.of<Cart>(context);
    
     double width = MediaQuery.of(context).size.width * 0.7;
    double widthFull = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Dismissible(
      key: ValueKey(widget.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        //cart.items.remove(widget.productId);
        Provider.of<Cart>(context, listen: false).removeItem(widget.productId);
      },
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
                                    image: AssetImage(widget.imagepath),
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
                                    widget.name,
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
                                        '\₹${widget.price}',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                      '\₹${widget.oldprice}',
                                           style: TextStyle(
                                        fontSize: 14.0,
                                         decoration: TextDecoration.lineThrough,
                                           color: Colors.grey),
                                       ),
                                       SizedBox(
                                         width: 8.0,
                                           ),
                                             Text(
                                           '₹${widget.offer}',
                                          style: TextStyle(fontSize: 14.0, color: Colors.red[700]),
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
                                                text: '${widget.size}',
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
                                          
                                            setState((){
                                            //  _items.remove(widget.productId);
                                            //cart.items.values.toList().removeAt(widget.productId);
                                                Provider.of<Cart>(context, listen: false).removeItem(widget.productId);
                                            });
                                          

                                          // Then show a snackbar.
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  content:
                                                      Text("Item Removed")));

                                          ProductPage();
                                        },
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                          new Row(
                            children: <Widget>[
                              _itemCount != 0
                                  ? new IconButton(
                                      icon: new Icon(Icons.remove),
                                      onPressed: () => setState(
                                          () => {




                                            _itemCount--,
                                            if(_itemCount!=0){
                                            Provider.of<Cart>(context, listen: false).removeSingleItem(widget.productId)
                                          }else{
                                              Provider.of<Cart>(context, listen: false).removeItem(widget.productId)
                                            }
                                          }

                                      ),
                                    )
                                  : new Container(),
                              new Text(_itemCount.toString()),
                              new IconButton(
                                  icon: new Icon(Icons.add),
                                  onPressed: () => setState(() =>
                                  {_itemCount++,
                                    Provider.of<Cart>(context, listen: false).addItem(widget.productId,widget.name,widget.imagepath,widget.price,widget.offer,widget.oldprice,widget.size)

                                  }
                                  ))
                            ],
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
              
  }
}

