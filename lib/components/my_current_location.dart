import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/restaurant.dart';

class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({super.key});

  final textController = TextEditingController();

  // Method to open location search box
  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text("Your Location"),
        content: TextField(
          controller: textController,
          autofocus: true, // Automatically focus the TextField when the dialog opens
          decoration: const InputDecoration(hintText: "Enter address..."),
        ),
        actions: [
          // Cancel button
          TextButton(
            onPressed: () {
              // Clear the text controller and dismiss the dialog
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text('Cancel'),
          ),

          // Save button
          TextButton(
            onPressed: () {
              String newAddress = textController.text;
              context.read<Restaurant>().updateDeliveryAddress(newAddress);
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "Deliver Now" label
          Text(
            "Deliver Now",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),

          // GestureDetector for address and dropdown menu
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                // Address Text
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Text(
                    restaurant.deliveryAddress.isEmpty
                        ? 'Enter your address'
                        : restaurant.deliveryAddress,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Dropdown Icon
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
