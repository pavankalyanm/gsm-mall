import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gsm_mall/pages/product/product.dart';

class CartItem {
  final String id;
  final String name;
  final int quantity;
  final int price;
  final String imagepath;
  final String offer;
  final String oldprice;
  final String size;

  CartItem(
      {@required this.id,
      @required this.name,
      @required this.quantity,
      @required this.price,
      @required this.imagepath,
      @required this.offer,
      @required this.oldprice,
      @required this.size});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String pdtid, String name,String imagepath, int price,String offer,String oldprice,String size) {
    if (_items.containsKey(pdtid)) {
      _items.update(
          pdtid,
          (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              imagepath: existingCartItem.imagepath,
              quantity: existingCartItem.quantity+1,
              price: existingCartItem.price,
              offer: existingCartItem.offer,
              oldprice: existingCartItem.oldprice,
              size: existingCartItem.size,
              ));
              bool isexist=true;
              exist(isexist: isexist);

    } else {
      _items.putIfAbsent(
          pdtid,
          () => CartItem(
                name: name,
                imagepath: imagepath,
                id: DateTime.now().toString(),
                quantity: 1,
                price: price,
                offer: offer,
                oldprice: oldprice,
                size: size
              ));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id].quantity > 1) {
      _items.update(
          id,
          (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              imagepath: existingCartItem.imagepath,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price,
              offer: existingCartItem.offer,
              oldprice: existingCartItem.oldprice,
              size:existingCartItem.size
              ));
    }
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}