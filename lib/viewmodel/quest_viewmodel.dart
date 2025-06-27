import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QuestViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Implementasi 'UPDATE' pada CRUD
  Future<String?> completeQuest(int xpGained) async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        // Ambil dokumen user yang sedang login
        final userDocRef = _firestore.collection('users').doc(user.uid);
        
        // Gunakan FieldValue.increment untuk menambahkan XP dengan aman
        await userDocRef.update({
          'xp': FieldValue.increment(xpGained),
        });
        return null; // Sukses
      }
      return "User tidak ditemukan.";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }
}