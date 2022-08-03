import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseOperation{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;


  Future<DocumentReference> addAMessageToTheDB({required String name, required String message}) async {
    
    DateTime currentPhoneDate = DateTime.now();
    DocumentReference _doc = await _firebaseFirestore.collection('sendmessage').add({
      "userName": "$name",
      "userMessage": "$message",
      "messageDate": currentPhoneDate,
    });
    return _doc;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> readTheMessagesDocument() async {
    return await _firebaseFirestore
        .collection('sendmessage')
        .orderBy("messageDate", descending: true)
        .get();
  }
}