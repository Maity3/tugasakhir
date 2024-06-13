import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:provider/provider.dart';
import 'package:sobatternak_application/pages/open_screen.dart';
import 'package:sobatternak_application/providers/news.provider.dart';

void main() async {
  // Inisialisasi Firebase sebelum menjalankan aplikasi
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Jalankan aplikasi
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NewsProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sobat Ternak',
        // Menggunakan tema gelap atau terang sesuai dengan tema sistem
        themeMode: ThemeMode.system,
        theme: ThemeData.light(), // Tema terang
        darkTheme: ThemeData.dark(), // Tema gelap
        home: const OpenUI(),
      ),
    );
  }
}
