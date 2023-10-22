import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/task.dart';
import '../models/user.dart';

class DbService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  static const String _usersCollection = 'users';
  static const String _couplesCollection = 'couples';
  static const String _tasksCollection = 'tasks';

  void addUser(User user) async {
    await _db.collection(_usersCollection).doc(user.email).set(
      {
        'displayName': user.displayName,
      },
    );
  }

  Future<List<User>> getUsers(User user) async {
    QuerySnapshot usersSnapshot = await _db.collection(_usersCollection).get();
    final users = usersSnapshot.docs.where((doc) => doc.id != user.email);

    return users.map(
      (user) {
        final userData = user.data() as Map<String, dynamic>;
        return User(
          email: user.id,
          displayName: userData.values.first,
        );
      },
    ).toList();
  }

  void addCouple(User user, User partner) async {
    await _db.collection(_couplesCollection).doc(user.email).set(
      {
        'partner': partner.email,
      },
    );
  }

  void addTask(User user, Task task) async {
    DocumentSnapshot tasksSnapshot =
        await _db.collection(_tasksCollection).doc(user.email).get();

    if (tasksSnapshot.exists) {
      await _db.collection(_tasksCollection).doc(user.email).update(
        {
          'tasks': FieldValue.arrayUnion(
            [
              task.toJson(),
            ],
          )
        },
      );
    } else {
      await _db.collection(_tasksCollection).doc(user.email).set(
        {
          'tasks': FieldValue.arrayUnion(
            [
              task.toJson(),
            ],
          )
        },
      );
    }
  }

  Future<List<Task>?> getTasks(User partner) async {
    DocumentSnapshot<Map<String, dynamic>> tasksSnapshot =
        await _db.collection(_tasksCollection).doc(partner.email).get();

    final tasksList = tasksSnapshot.data()?['tasks'] as List<dynamic>?;

    if (tasksList == null) {
      return null;
    }

    return tasksList
        .map(
          (taskData) => Task.fromJson(taskData),
        )
        .toList();
  }
}
