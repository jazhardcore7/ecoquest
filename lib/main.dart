import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:ecoquest/viewmodel/auth_viewmodel.dart';
import 'package:ecoquest/viewmodel/quest_viewmodel.dart'; // Import ViewModel baru
import 'package:ecoquest/view/screens/auth_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Gunakan MultiProvider untuk mendaftarkan semua ViewModel
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => QuestViewModel()),
      ],
      child: MaterialApp(
        title: 'EcoQuest',
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'Poppins',
        ),
        home: const AuthGate(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
