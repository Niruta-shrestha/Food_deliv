import 'package:flutter/material.dart';
import 'package:flutter_app/pages/cart_page.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child; // Typically the background content for flexible space
  final Widget title; // Title widget that is placed in the SliverAppBar

  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 400,
      // Height of the app bar when fully expanded
      collapsedHeight: 100,
      // Height of the app bar when collapsed
      floating: false,
      // Does not float when scrolling
      pinned: true,
      // Keeps the app bar visible when collapsed
      actions: [
        // Cart icon button
        IconButton(
          onPressed: () {
            // Navigate to the cart page when the cart button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ),
            );
          },
          icon: const Icon(Icons.shopping_cart_outlined),
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("Sunset Diner"),
      flexibleSpace: FlexibleSpaceBar(
        background: child,
        title: Center(child: title),
        centerTitle: true,
        // Ensures title is centered
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        // No padding around the title
        expandedTitleScale: 1, // Keep title size fixed during expansion
      ),
    );
  }
}
