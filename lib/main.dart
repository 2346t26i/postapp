import 'package:flutter/material.dart';
import 'login.dart'; 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Désactiver le DebugCheckBanner
      home: const LoginPage(), // Utiliser LoginScreen comme écran d'accueil
    );
  }
}
