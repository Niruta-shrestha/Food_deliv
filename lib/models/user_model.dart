import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String userName;
  String email;
  String number;  // Phone number stored as a String

  UserModel({
    required this.email,
    required this.userName,
    required this.number,
  });

  // Convert UserModel to Map for Firestore storage
  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'number': number,
    };
  }

  // Convert Map from Firestore to UserModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      userName: map['userName'] ?? '',
      number: map['number'] ?? '',
    );
  }
}

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Save User to Firestore
  Future<void> saveUser(UserModel user) async {
    try {
      // Save user data in Firestore, using email as the document ID
      await _firestore.collection('users').doc(user.email).set(user.toMap());
      print('User saved successfully!');
    } catch (e) {
      print('Error saving user: $e');
    }
  }

  Future<UserModel?> getUserByEmail(String email) async {
    try {
      DocumentSnapshot docSnapshot = await _firestore.collection('users').doc(email).get();
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
}
