import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  //get collectin of orders
  final CollectionReference orders = 
    FirebaseFirestore.instance.collection('Orders');

//save order to database
Future<void> saveOrderToDatabase(String receipt)async{
  await orders.add({
    'date': DateTime.now(),
    'order':receipt,
    //add more field as necessary

  });
}

}