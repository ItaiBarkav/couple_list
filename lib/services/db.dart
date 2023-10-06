import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class DbService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void addUser(User user) async {
    await _db
        .collection("users")
        .doc(user.email)
        .set({"displayName": user.displayName});
  }
}
