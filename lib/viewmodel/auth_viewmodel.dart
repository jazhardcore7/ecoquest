import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();
  User? get currentUser => _auth.currentUser;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Fungsi Sign In dengan Email & Password
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    _setLoading(true);
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _setLoading(false);
      return null; // Sukses, tidak ada error
    } on FirebaseAuthException catch (e) {
      _setLoading(false);
      return e.message; // Mengembalikan pesan error
    }
  }

  // Fungsi Sign Up (Register) dengan Email & Password
  Future<String?> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    _setLoading(true);
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Setelah user berhasil dibuat, simpan data tambahan ke Firestore
      // Ini adalah bagian dari implementasi 'CREATE' dalam CRUD
      if (userCredential.user != null) {
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'name': name,
          'email': email,
          'xp': 0,
          'level': 1,
          'createdAt': Timestamp.now(),
        });
      }
      _setLoading(false);
      return null;
    } on FirebaseAuthException catch (e) {
      _setLoading(false);
      return e.message;
    }
  }

  // Fungsi untuk Logout
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
