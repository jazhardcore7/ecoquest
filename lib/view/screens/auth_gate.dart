
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecoquest/view/screens/main_page.dart'; 
import 'package:ecoquest/view/screens/auth_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const AuthPage();
        }
        // Arahkan ke MainPage setelah login
        return const MainPage(); 
      },
    );
  }
}
