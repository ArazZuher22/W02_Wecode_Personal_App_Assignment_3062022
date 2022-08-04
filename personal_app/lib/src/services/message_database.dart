import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseOperation{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;


  Future<DocumentReference> addAMessageAnonymousToTheDB({required String title, required String message}) async {
    
    DateTime currentPhoneDate = DateTime.now();
    DocumentReference _doc = await _firebaseFirestore.collection('anonymousMessage').add({
      "titleMessage": "$title",
      "message": "$message",
      "messageDate": currentPhoneDate,
    });
    return _doc;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> readTheMessagesAnonymousDocument() async {
    return await _firebaseFirestore
        .collection('anonymousMessage')
        .orderBy("messageDate", descending: true)
        .get();
  }


  Future<DocumentReference> addAMessageCompanyToTheDB({required User user ,required String companyorg, required String role,required String url}) async {
    
    DateTime currentPhoneDate = DateTime.now();
    DocumentReference _doc = await _firebaseFirestore.collection('companymessage').add({
      "companyOrg": "$companyorg",
      "role": "$role",
      "url":"$url",
      "userEmail": user.email,
      "userName": user.displayName,
      "messageDate": currentPhoneDate,
    });
    return _doc;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> readTheMessagesCompaynDocument() async {
    return await _firebaseFirestore
        .collection('companymessage')
        .orderBy("messageDate", descending: true)
        .get();
  }
}