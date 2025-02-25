import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.white,
      child: Column(
        children: [
          DrawerHeader(child: Text("Admin Panel", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
          _buildMenuItem("Dashboard", Icons.dashboard, () {}),
          _buildMenuItem("Orders", Icons.list, () {}),
          _buildMenuItem("Menu", Icons.fastfood, () {}),
          _buildMenuItem("Customers", Icons.people, () {}),
          _buildMenuItem("Settings", Icons.settings, () {}),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(title, style: TextStyle(fontSize: 18)),
      onTap: onTap,
    );
  }
}
