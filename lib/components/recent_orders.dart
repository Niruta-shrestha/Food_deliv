// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class RecentOrders extends StatelessWidget {
  RecentOrders({super.key});
  final List<Map<String, String>> orders = [
    
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Recent Orders", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          DataTable(
            columns: [
              DataColumn(label: Text("Order ID")),
              DataColumn(label: Text("Customer")),
              DataColumn(label: Text("Amount")),
              DataColumn(label: Text("Status")),
            ],
            rows: orders.map((order) {
              return DataRow(cells: [
                DataCell(Text(order["id"]!)),
                DataCell(Text(order["customer"]!)),
                DataCell(Text(order["amount"]!)),
                DataCell(
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: order["status"] == "Completed"
                          ? Colors.green.withOpacity(0.1)
                          : order["status"] == "Pending"
                              ? Colors.orange.withOpacity(0.1)
                              : Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(order["status"]!, style: TextStyle(color: Colors.black)),
                  ),
                ),
              ]);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
