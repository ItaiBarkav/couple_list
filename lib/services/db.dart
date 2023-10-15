import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class DbService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  static const String _usersCollection = 'users';
  static const String _couplesCollection = 'couples';

  void addUser(User user) async {
    await _db.collection(_usersCollection).doc(user.email).set(
      {'displayName': user.displayName},
    );
  }

  Future<List<User>> getUsers() async {
    List<User> users = [];
    QuerySnapshot usersSnapshot = await _db.collection(_usersCollection).get();

    for (var i = 0; i < usersSnapshot.docs.length; i++) {
      users.add(
        User(
            email: usersSnapshot.docs[i].id,
            displayName: (usersSnapshot.docs[i].data() as Map<String, dynamic>)
                .values
                .first),
      );
    }

    return users;
  }

  void addCouple(User user, User partner) async {
    await _db.collection(_couplesCollection).doc(user.email).set(
      {'partner': partner.email},
    );
  }
}
