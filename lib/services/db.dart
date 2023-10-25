import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/task.dart';
import '../models/user.dart';

class DbService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  static const String _users = 'users';
  static const String _couples = 'couples';
  static const String _tasks = 'tasks';

  void addUser(User user) async {
    await _db.collection(_users).doc(user.email).set(
      {
        'displayName': user.displayName,
      },
    );
  }

  Future<List<User>> getUsers(User user) async {
    QuerySnapshot usersSnapshot = await _db.collection(_users).get();
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
    await _db.collection(_couples).doc(user.email).set(
      {
        'partner': partner.email,
      },
    );
  }

  void addTask(User user, Task task) async {
    DocumentSnapshot tasksSnapshot =
        await _db.collection(_tasks).doc(user.email).get();

    if (tasksSnapshot.exists) {
      await _db.collection(_tasks).doc(user.email).update(
        {
          _tasks: FieldValue.arrayUnion(
            [
              task.toJson(),
            ],
          )
        },
      );
    } else {
      await _db.collection(_tasks).doc(user.email).set(
        {
          _tasks: FieldValue.arrayUnion(
            [
              task.toJson(),
            ],
          )
        },
      );
    }
  }

  Stream<List<Task>> getTasks(User partner) {
    return _db.collection(_tasks).doc(partner.email).snapshots().map(
      (tasksSnapshot) {
        final tasksList = tasksSnapshot.data()?[_tasks] as List<dynamic>?;

        if (tasksList == null) {
          return [];
        }

        return tasksList
            .map(
              (taskData) => Task.fromJson(taskData),
            )
            .toList();
      },
    );
  }

  void removeTask(User partner, Task task) async {
    _db.collection(_tasks).doc(partner.email).update(
      {
        _tasks: FieldValue.arrayRemove(
          [
            task.toJson(),
          ],
        ),
      },
    );

    _db.collection(_tasks).doc(partner.email).update(
      {
        _tasks: FieldValue.arrayUnion(
          [
            task.copyWith(status: "done").toJson(),
          ],
        ),
      },
    );
  }
}
