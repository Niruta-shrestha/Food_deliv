import 'package:flutter/material.dart';
import 'package:flutter_app/components/recent_orders.dart';
import 'package:flutter_app/components/sales_chart.dart';
import 'package:flutter_app/components/side_menu.dart';


class AdminHome extends StatelessWidget {
  const AdminHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Row(
        children: [
          SideMenu(), // Sidebar Navigation
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  SizedBox(height: 20),
                  _buildSummaryCards(),
                  SizedBox(height: 20),
                  Expanded(child: _buildDashboardContent()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Restaurant Admin Dashboard",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Icon(Icons.notifications, size: 30),
      ],
    );
  }

  Widget _buildSummaryCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCard("Total Orders", "350", Icons.shopping_bag),
        _buildCard("Revenue", "\$12,500", Icons.attach_money),
        _buildCard("Best Seller", "Cheese Burger", Icons.fastfood),
        _buildCard("Pending Orders", "15", Icons.hourglass_bottom),
      ],
    );
  }

  Widget _buildCard(String title, String value, IconData icon) {
    return Expanded(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 40, color: Colors.orange),
              SizedBox(height: 10),
              Text(title, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
              SizedBox(height: 5),
              Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardContent() {
    return Column(
      children: [
        Expanded(child: SalesChart()), // Sales Graph
        SizedBox(height: 20),
        Expanded(child: RecentOrders()), // Recent Orders Table
      ],
    );
  }
}
