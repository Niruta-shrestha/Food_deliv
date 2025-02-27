import 'package:flutter/material.dart';
import 'package:flutter_app/components/my_button.dart';
import 'package:flutter_app/components/my_cart_tile.dart';
import 'package:flutter_app/models/restaurant.dart';
import 'package:flutter_app/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        //cart
        final userCart = restaurant.cart;

        //scaffold ui
        return Scaffold(
            appBar: AppBar(
              title: const Text("Cart"),
              backgroundColor: Colors.transparent,
              foregroundColor: Theme.of(context).colorScheme.inversePrimary,
              actions: [
                //clear cart button
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text("Clear the cart?"),
                              actions: [
                                //cancel button
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("Cancel"),
                                ),

                                //yes button
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    restaurant.clearCart();
                                  },
                                  child: const Text("Yes"),
                                ),
                              ],
                            ));
                  },
                  icon: const Icon(Icons.delete),
                )
              ],
            ),
            body: Column(
              children: [
                //list of cart
                Expanded(
                  child: Column(
                    children: [
                      userCart.isEmpty
                          ? const Expanded(
                              child: Center(
                                child: Text("cart is empty.."),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: userCart.length,
                                itemBuilder: (context, index) {
                                  //get individual cart item
                                  final cartItem = userCart[index];

                                  //return cart title ui
                                  return MyCartTile(cartItem: cartItem);
                                },
                              ),
                            ),
                    ],
                  ),
                ),

                //button to pay
                // MyButton(
                //     onTap: () => Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => const PaymentPage(),
                //           ),
                //         ),
                //     text: "go to checkout"),

                const SizedBox(height: 25),
              ],
            ));
      },
    );
  }
}
