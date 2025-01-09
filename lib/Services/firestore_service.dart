import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addPersonalDetails(Map<String, dynamic> data) async {
    try {
      await _db.collection('personal_details').add(data);
    } catch (e) {
      print("Error adding personal details: $e");
    }
  }
}
