import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecoquest/viewmodel/auth_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginScreen({super.key, required this.showRegisterPage});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleSignIn() async {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final error = await authViewModel.signIn(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    if (error != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Mengambil ViewModel dari Provider
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.eco, size: 100, color: Colors.green.shade700),
                const SizedBox(height: 20),
                Text('Selamat Datang di EcoQuest!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey.shade800)),
                Text('Mulai petualangan hijaumu sekarang', style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
                const SizedBox(height: 50),
                
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email', hintText: 'Masukkan email Anda', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none)),
                ),
                const SizedBox(height: 16),
                
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password', hintText: 'Masukkan password Anda', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none)),
                ),
                const SizedBox(height: 30),
                
                // Tampilkan loading indicator jika sedang proses
                authViewModel.isLoading
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _handleSignIn,
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade600, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                          child: const Text('Login', style: TextStyle(fontSize: 18, color: Colors.white)),
                        ),
                      ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Belum punya akun?'),
                    TextButton(
                      onPressed: widget.showRegisterPage, // Panggil callback untuk ganti halaman
                      child: Text('Daftar Sekarang', style: TextStyle(color: Colors.green.shade800, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
