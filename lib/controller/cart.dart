// ignore_for_file: avoid_types_as_parameter_names

import 'package:get/get.dart';

class CartItem {
  final String id;
  final String name;
  final String image;
  final int quantity;
  final double price;
  CartItem(
      {required this.id,
        required this.name,
        required this.image,
        required this.quantity,
        required this.price});
}

class CartControllers extends GetxController {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalamount {
    var total = 0.0;
    // ignore: non_constant_identifier_names
    _items.forEach((key, CartItem) {
      total += (CartItem.price * CartItem.quantity);
    });
    return total;
  }

  void addItem(
      String productId,
      double price,
      String name,
      String image,
      ) {
    print("${itemCount}zzzzzz");
    if (_items.containsKey(productId)) {
      // change quantity...
      _items.update(
        productId,
            (existingCartItem) => CartItem(
          id: existingCartItem.id,
          name: existingCartItem.name,
          price: existingCartItem.price,
          image: existingCartItem.image,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
            () => CartItem(
          id: DateTime.now().toString(),
          name: name,
          price: price,
          image: image,
          quantity: 1,
        ),
      );
    }
    update();
  }

  void increment(CartItem item) {}

  // ignore: non_constant_identifier_names
  void RemoveItem(String productId) {
    _items.remove(productId);

    update();
  }

  void clear() {
    _items = {};
    update();
  }
}