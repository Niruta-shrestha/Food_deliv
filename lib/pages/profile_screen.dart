// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<UserModel?> user;

  @override
  void initState() {
    super.initState();
    // Get the email of the currently logged-in user
    String email = FirebaseAuth.instance.currentUser?.email ?? '';

    if (email.isNotEmpty) {
      user = getUserByEmail(email);
    } else {
      user = Future.value(null);  // Handle case when no user is logged in
    }
  }

  Future<UserModel?> getUserByEmail(String email) async {
    try {
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(email)
          .get();

      if (docSnapshot.exists) {
        return UserModel.fromMap(docSnapshot.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching user: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<UserModel?>(
          future: user,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return Center(child: Text("User not found"));
            } else {
              final userData = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Picture
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    child: CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.grey[200],
                      child: Icon(
                        Icons.person,
                        size: 100,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Username Section
                  buildProfileTile(
                    context,
                    icon: Icons.person_2_outlined,
                    title: 'User Name',
                    subtitle: userData.userName,
                  ),

                  // Email Section
                  buildProfileTile(
                    context,
                    icon: Icons.email_outlined,
                    title: 'Email',
                    subtitle: userData.email,
                  ),

                  // Contact Number Section
                  buildProfileTile(
                    context,
                    icon: Icons.phone_outlined,
                    title: 'Contact Number',
                    subtitle: userData.number.toString(),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  // Helper method to create the profile list items
  Widget buildProfileTile(BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          leading: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}
