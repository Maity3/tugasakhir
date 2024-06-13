import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sobatternak_application/pages/AuthenChecker.dart';
import 'package:sobatternak_application/pages/welcome_screen.dart';

class OpenUI extends StatefulWidget {
  const OpenUI({Key? key}) : super(key: key);

  @override
  _OpenUIState createState() => _OpenUIState();
}

class _OpenUIState extends State<OpenUI> {
  Future<void> _checkLoginStatus() async {
    await Future.delayed(Duration(seconds: 3)); // Durasi splash screen
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => AuthChecker(isLoggedIn: isLoggedIn)),
    );
  }

  @override
  void initState() {
    super.initState();
    // Langsung pindah ke tampilan utama setelah 7 detik
    _checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Tampilkan logo atau gambar splash screen Anda
        child: Image.asset(
          'assets/images/animations/logo.gif', // Ganti dengan path gambar logo Anda
          width: 200.0, // Ganti dengan lebar yang diinginkan
          height: 200.0, // Ganti dengan tinggi yang diinginkan
        ),
      ),
    );
  }

  // Metode untuk pindah ke halaman utama
  void _navigateToWelcome_Screen(BuildContext context) {
    Future.delayed(Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => welcome_screen()),
      );
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: OpenUI(),
  ));
}
