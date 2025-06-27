import 'package:cloud_firestore/cloud_firestore.dart';

class Quest {
  final String id;
  final String title;
  final String description;
  final int xp;
  final String category;

  Quest({
    required this.id,
    required this.title,
    required this.description,
    required this.xp,
    required this.category,
  });

  factory Quest.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Quest(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      xp: data['xp'] ?? 0,
      category: data['category'] ?? 'Umum',
    );
  }
}