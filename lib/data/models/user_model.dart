import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final int xp;
  final int level;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.xp,
    required this.level,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: doc.id,
      name: data['name'] ?? 'No Name',
      email: data['email'] ?? 'No Email',
      xp: data['xp'] ?? 0,
      level: data['level'] ?? 1,
    );
  }
}