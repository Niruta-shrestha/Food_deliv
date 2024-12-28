import 'package:flutter/material.dart';
import 'package:flutter_app/pages/cart_page.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        //cart MyButton
        IconButton(
          onPressed: () {
            //go to cart page
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ));
          },
          icon: const Icon(Icons.shopping_cart_outlined),
        )
      ],
      
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("sunset diner"),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: Center(child: title),
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}