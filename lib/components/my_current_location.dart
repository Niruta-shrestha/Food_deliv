import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
   MyCurrentLocation({super.key});

  final textController = TextEditingController();

  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text("Your location"),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: "Enter address..."),
        ),
        actions: [
          // cancel Button
          MaterialButton(
            onPressed:(){
               Navigator.pop(context);
               textController.clear();
               },
            child: const Text('Cancel'),
          ),

          //save Button
          MaterialButton(
            onPressed: (){
              String newAddress =textController.text;
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
          Text(
            "deliver now",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                //address
                Consumer<Restaurant>(
                  builder:(context, restaurant, child) => Text(
                    restaurant.deliveryAddress,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                  ),
                //drop down menuu
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }
}
