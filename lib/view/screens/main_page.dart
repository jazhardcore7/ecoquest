import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecoquest/view/screens/home_screen.dart';
import 'package:ecoquest/view/screens/leaderboard_screen.dart';
import 'package:ecoquest/view/screens/profile_screen.dart';
import 'package:ecoquest/viewmodel/auth_viewmodel.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const LeaderboardScreen(),
    const ProfileScreen(),
  ];

  final List<String> _titles = [
    'Papan Misi',
    'Papan Peringkat',
    'Profil Saya'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () => authViewModel.signOut(),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Misi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Peringkat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green.shade800,
        onTap: _onItemTapped,
      ),
    );
  }
}
