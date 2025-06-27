import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecoquest/data/models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return const Center(child: Text("Silakan login terlebih dahulu."));
    }

    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc(user.uid).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text("Data pengguna tidak ditemukan."));
          }

          final userData = UserModel.fromFirestore(snapshot.data!);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.person, size: 80, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Text(userData.name, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                Text(userData.email, style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
                const SizedBox(height: 40),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(userData.level.toString(), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                            const Text("Level", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Column(
                          children: [
                            Text(userData.xp.toString(), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.amber)),
                            const Text("XP", style: TextStyle(fontSize: 16, color: Colors.amber)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
