import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'cart_item.dart';
import 'food.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class Restaurant extends ChangeNotifier {
  //list of food menuu

  final List<Food> _menu = [
    //momo
    Food(
      name: "Classic MO:MO",
      description:
          "A traditional favorite, featuring minced buffalo meat mixed with fresh herbs and spices, encased in a delicate dough and steamed to perfection.",
      imagePath: "lib/images/momos/m1.jpg",
      price: 150.0,
      category: FoodCategory.momo,
      availableAddons: [
        Addon(name: "Extra half-plate", price: 60.0),
        Addon(name: "Sauce", price: 0.00),
        Addon(name: "Piro achar", price: 10.0),
      ],
    ),
    Food(
      name: "Chicken MO:MO",
      description:
          " Tender chicken seasoned with a blend of aromatic spices, wrapped in a soft, steamed dough.",
      imagePath: "lib/images/momos/m2.jpg",
      price: 180.0,
      category: FoodCategory.momo,
      availableAddons: [
        Addon(name: "Extra half-plate", price: 70.0),
        Addon(name: "Sauce", price: 0.00),
        Addon(name: "Piro achar", price: 10.0),
      ],
    ),
    Food(
      name: "Veg MO:MO",
      description:
          "A delightful mix of finely chopped vegetables, including cabbage, carrots, and bell peppers, seasoned with savory spices and encased in a light, steamed wrapper.",
      imagePath: "lib/images/momos/m1.jpg",
      price: 130.0,
      category: FoodCategory.momo,
      availableAddons: [
        Addon(name: "Extra half-plate", price: 60.0),
        Addon(name: "Sauce", price: 0.00),
        Addon(name: "Piro achar", price: 10.0),
      ],
    ),
    Food(
      name: "Classic MO:MO",
      description:
          "A traditional favorite, featuring minced buffalo meat mixed with fresh herbs and spices, encased in a delicate dough and steamed to perfection.",
      imagePath: "lib/images/momos/m2.jpg",
      price: 150.0,
      category: FoodCategory.momo,
      availableAddons: [
        Addon(name: "Extra half-plate", price: 60.0),
        Addon(name: "Sauce", price: 0.00),
        Addon(name: "Piro achar", price: 10.0),
      ],
    ),
    Food(
      name: "Tofu MO:MO",
      description:
          "nutritious mix of fresh vegetables and tofu, seasoned with a blend of Asian spices and wrapped in a light dough.",
      imagePath: "lib/images/momos/m1.jpg",
      price: 200.0,
      category: FoodCategory.momo,
      availableAddons: [
        Addon(name: "Extra half-plate", price: 90.0),
        Addon(name: "Sauce", price: 0.00),
        Addon(name: "Piro achar", price: 10.0),
      ],
    ),

    //pizza
    Food(
      name: "Classic Pizza ",
      description:
          " A classic favorite with a simple yet delightful combination of fresh tomatoes, creamy mozzarella, and aromatic basil leaves. Drizzled with a touch of extra virgin olive oil for a perfect balance of flavors.",
      imagePath: "lib/images/pizzas/p1.jpg",
      price: 350.0,
      category: FoodCategory.pizzas,
      availableAddons: [
        Addon(name: "extra-cheese", price: 50.0),
        Addon(name: "sauce", price: 0.00),
        Addon(name: "olives", price: 20.0),
      ],
    ),
    Food(
      name: "Pepperoni Pizza",
      description:
          "Loaded with zesty pepperoni slices and melted mozzarella cheese atop a rich tomato sauce. Each bite offers a savory and slightly spicy kick, making it a timeless favorite.",
      imagePath: "lib/images/pizzas/p3.jpg",
      price: 380.0,
      category: FoodCategory.pizzas,
      availableAddons: [
        Addon(name: "extra-cheese", price: 50.0),
        Addon(name: "sauce", price: 0.00),
        Addon(name: "extra pepperoni ", price: 30.0),
      ],
    ),
    Food(
      name: "Veggie Supreme Pizza",
      description:
          " A garden of fresh vegetables, including bell peppers, mushrooms, onions, and black olives, layered over a hearty tomato sauce and topped with melted mozzarella. A colorful and wholesome choice for veggie lovers.",
      imagePath: "lib/images/pizzas/p2.jpg",
      price: 300.0,
      category: FoodCategory.pizzas,
      availableAddons: [
        Addon(name: "extra cheese", price: 50.0),
        Addon(name: "sauce", price: 0.00),
        Addon(name: "extra veggies", price: 20.0),
      ],
    ),
    Food(
      name: "BBQ Chicken Pizza",
      description:
          "Smoky barbecue sauce pairs with tender chicken pieces, red onions, and cilantro, all baked to perfection under a layer of gooey mozzarella cheese. A deliciously tangy and savory twist on traditional pizza.",
      imagePath: "lib/images/pizzas/p4.jpg",
      price: 450.0,
      category: FoodCategory.pizzas,
      availableAddons: [
        Addon(name: "extra cheese", price: 50.0),
        Addon(name: "sauce", price: 0.00),
        Addon(name: "extra chickens", price: 40.0),
      ],
    ),
    Food(
      name: "Four Cheese Pizza",
      description:
          "A luxurious blend of four cheeses—mozzarella, cheddar, parmesan, and gorgonzola—melted together on a crisp crust. Rich and indulgent, it's a cheese lover's dream come true.",
      imagePath: "lib/images/pizzas/p5.jpg",
      price: 390.0,
      category: FoodCategory.pizzas,
      availableAddons: [
        Addon(name: "extra cheese", price: 60.0),
        Addon(name: "Sauce", price: 0.00),
        Addon(name: "extra requests", price: 70.0),
      ],
    ),
    //sides
    Food(
      name: "Garlic Bread",
      description:
          "Crispy, toasted bread topped with a generous spread of garlic butter and herbs.",
      imagePath: "lib/images/sides/s2.jpg",
      price: 80.0,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "extra garlic breads", price: 20.0),
      ],
    ),
    Food(
      name: "Mozzarella Sticks",
      description:
          "Golden-fried sticks of gooey mozzarella cheese, served with a side of marinara sauce for dipping.",
      imagePath: "lib/images/sides/s3.jpg",
      price: 80.0,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "extra sticks", price: 20.0),
      ],
    ),
    Food(
      name: "Caesar Salad",
      description:
          "Crisp romaine lettuce tossed with creamy Caesar dressing, crunchy croutons, and freshly grated parmesan cheese. ",
      imagePath: "lib/images/sides/s1.jpg",
      price: 150.0,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "extra veggies", price: 20.0),
        Addon(name: "Sauce", price: 0.00),
      ],
    ),
    Food(
      name: "Loaded Nachos",
      description:
          "risp tortilla chips piled high with melted cheese, jalapeños, and savory toppings. ",
      imagePath: "lib/images/sides/s4.jpg",
      price: 390.0,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "extra cheese", price: 50.0),
        Addon(name: "Sauce", price: 0.00),
      ],
    ),
    //desserts
    Food(
      name: "ice-cream",
      description:
          " A classic favorite with a simple yet delightful combination of fresh tomatoes, creamy mozzarella, and aromatic basil leaves. Drizzled with a touch of extra virgin olive oil for a perfect balance of flavors.",
      imagePath: "lib/images/desserts/d1.jpg",
      price: 350.0,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "extra-cheese", price: 50.0),
        Addon(name: "sauce", price: 0.00),
        Addon(name: "olives", price: 20.0),
      ],
    ),
    Food(
      name: "Tiramisu",
      description:
          " A classic favorite with a simple yet delightful combination of fresh tomatoes, creamy mozzarella, and aromatic basil leaves. Drizzled with a touch of extra virgin olive oil for a perfect balance of flavors.",
      imagePath: "lib/images/desserts/d1.jpg",
      price: 350.0,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "extra-cheese", price: 50.0),
        Addon(name: "sauce", price: 0.00),
        Addon(name: "olives", price: 20.0),
      ],
    ),
    Food(
      name: "Cake",
      description:
          " A classic favorite with a simple yet delightful combination of fresh tomatoes, creamy mozzarella, and aromatic basil leaves. Drizzled with a touch of extra virgin olive oil for a perfect balance of flavors.",
      imagePath: "lib/images/desserts/d1.jpg",
      price: 350.0,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "extra-cheese", price: 50.0),
        Addon(name: "sauce", price: 0.00),
        Addon(name: "olives", price: 20.0),
      ],
    ),
    Food(
      name: "pastry ",
      description:
          " A classic favorite with a simple yet delightful combination of fresh tomatoes, creamy mozzarella, and aromatic basil leaves. Drizzled with a touch of extra virgin olive oil for a perfect balance of flavors.",
      imagePath: "lib/images/desserts/d1.jpg",
      price: 350.0,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "extra-cheese", price: 50.0),
        Addon(name: "sauce", price: 0.00),
        Addon(name: "olives", price: 20.0),
      ],
    ),
    //drinks
    Food(
      name: "Mojito",
      description:
          " A classic favorite with a simple yet delightful combination of fresh tomatoes, creamy mozzarella, and aromatic basil leaves. Drizzled with a touch of extra virgin olive oil for a perfect balance of flavors.",
      imagePath: "lib/images/drinks/moj.jpg",
      price: 350.0,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "extra-cheese", price: 50.0),
        Addon(name: "sauce", price: 0.00),
        Addon(name: "olives", price: 20.0),
      ],
    ),
    Food(
      name: "mocktail",
      description:
          " A classic favorite with a simple yet delightful combination of fresh tomatoes, creamy mozzarella, and aromatic basil leaves. Drizzled with a touch of extra virgin olive oil for a perfect balance of flavors.",
      imagePath: "lib/images/drinks/mock.jpg",
      price: 350.0,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "extra-cheese", price: 50.0),
        Addon(name: "sauce", price: 0.00),
        Addon(name: "olives", price: 20.0),
      ],
    ),
    Food(
      name: "Whiskey ",
      description:
          " A classic favorite with a simple yet delightful combination of fresh tomatoes, creamy mozzarella, and aromatic basil leaves. Drizzled with a touch of extra virgin olive oil for a perfect balance of flavors.",
      imagePath: "lib/images/drinks/whi.jpg",
      price: 350.0,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "extra-cheese", price: 50.0),
        Addon(name: "sauce", price: 0.00),
        Addon(name: "olives", price: 20.0),
      ],
    ),
  ];

  //user cart
  final List<CartItem> _cart = [];

  //delivery address
  String _deliveryAddress = 'Imadol,pokhari';
  /*

  G E TT E R s
  */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;
  /*
  OPERATIONNS

  */

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //check if there is food items already and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food item are same
      bool isSameFood = item.food == food;

      //check if the list of selected addons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });
    //if item already exists , increase its quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    //otherqise add new cart item to cart
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != 1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  // get total price of cartAddon
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // get total no of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //  clear the cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  /*

  H E L P E R S

  */
  //generate recipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    //format the date to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln("     Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");
    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "Rs.${price.toStringAsFixed(2)}";
  }

  // format list of addons into  a string
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name}(${_formatPrice(addon.price)})")
        .join(",");
  }
}
