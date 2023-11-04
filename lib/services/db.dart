import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/task.dart';
import '../models/user.dart';

class DbService {
  static const String _users = 'users';
  static const String _user = 'user';
  static const String _couples = 'couples';
  static const String _tasks = 'tasks';
  static const String _partner = 'partner';
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void addCouple(User user, User partner) async {
    await _db.collection(_couples).doc(user.email).set(
      {
        _partner: partner.toJson(),
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

  void addUser(User user) async {
    await _db.collection(_users).doc(user.email).get().then(
      (value) {
        var userData = value.data();

        if (userData == null) {
          _db.collection(_users).doc(user.email).set(
            {
              _user: user.toJson(),
            },
          );
        }
      },
    );
  }

  void completeTask(User user, User partner, Task task) async {
    _db.collection(_tasks).doc(partner.email).update(
      {
        _tasks: FieldValue.arrayRemove(
          [
            task.toJson(),
          ],
        ),
      },
    );

    _updateScore(user, task.cost);

    _db.collection(_tasks).doc(partner.email).update(
      {
        _tasks: FieldValue.arrayUnion(
          [
            task.copyWith(status: 'done').toJson(),
          ],
        ),
      },
    );
  }

  Stream<int> getScore(User user) {
    return _db.collection(_users).doc(user.email).snapshots().map(
          (value) => User.fromJson(
            value.data()?[_user],
          ).score,
        );
  }

  Stream<List<Task>> getTasks(User user) {
    return _db.collection(_tasks).doc(user.email).snapshots().map(
      (tasksSnapshot) {
        final tasksList = tasksSnapshot.data()?[_tasks] as List<dynamic>?;

        if (tasksList == null) {
          return [];
        }

        return tasksList
            .map(
              (taskData) => Task.fromJson(taskData),
            )
            .where((element) => element.status == 'new')
            .toList();
      },
    );
  }

  Stream<User> getUser(User user) {
    return _db.collection(_users).doc(user.email).snapshots().map(
          (value) => User.fromJson(
            value.data()?[_user],
          ),
        );
  }

  Future<List<User>> getUsers(User user) async {
    QuerySnapshot usersSnapshot = await _db.collection(_users).get();
    final users = usersSnapshot.docs.where((doc) => doc.id != user.email);

    return users.map(
      (user) {
        final userData = user.data() as Map<String, dynamic>;

        return User.fromJson(
          userData[_user],
        );
      },
    ).toList();
  }

  Future<User?> haveCouple(User user) async {
    return await _db.collection(_couples).doc(user.email).get().then(
      (value) {
        var partner = value.data();

        if (partner == null) {
          return null;
        }

        return User.fromJson(
          partner[_partner],
        );
      },
    );
  }

  void _updateScore(User user, int score) async {
    _db.collection(_users).doc(user.email).update({
      _user: user.copyWith(score: user.score + score).toJson(),
    });
  }
}
