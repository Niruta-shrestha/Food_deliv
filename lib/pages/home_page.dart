import 'package:flutter/material.dart';
import 'package:flutter_app/components/my_current_location.dart';
import 'package:flutter_app/components/my_description_box.dart';
import 'package:flutter_app/components/my_drawer.dart';
import 'package:flutter_app/components/my_sliver_app_bar.dart';
import 'package:flutter_app/components/my_tab_bar.dart';
import 'package:flutter_app/models/food.dart';
import 'package:provider/provider.dart';

import '../components/my_food_tile.dart';
import '../models/restaurant.dart';
import 'food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Helper method to filter foods by category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // This method builds food items for a given category
  Widget _buildFoodListForCategory(FoodCategory category, List<Food> fullMenu) {
    List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

    return ListView.builder(
      itemCount: categoryMenu.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final food = categoryMenu[index];
        return FoodTile(
          food: food,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodPage(food: food),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Current Location Widget
                const SizedBox(height: 15),
                 MyCurrentLocation(),
                const MyDescriptionBox(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
        body: SafeArea(
          child: Consumer<Restaurant>(
            builder: (context, restaurant, child) {
              if (restaurant.menu.isEmpty) {
                return const Center(child: Text("No food available"));
              }
              return TabBarView(
                controller: _tabController,
                children: FoodCategory.values.map((category) {
                  return _buildFoodListForCategory(category, restaurant.menu);
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}

