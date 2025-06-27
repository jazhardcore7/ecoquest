import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecoquest/data/models/user_model.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        // Ambil semua user, urutkan berdasarkan XP dari yang tertinggi
        stream: FirebaseFirestore.instance.collection('users').orderBy('xp', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Terjadi error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Papan peringkat masih kosong.'));
          }

          final users = snapshot.data!.docs.map((doc) => UserModel.fromFirestore(doc)).toList();

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: ListTile(
                  leading: Text(
                    '#${index + 1}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  title: Text(user.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                  trailing: Text(
                    '${user.xp} XP',
                    style: TextStyle(fontSize: 16, color: Colors.amber.shade900, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
