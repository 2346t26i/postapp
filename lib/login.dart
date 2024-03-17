import 'package:flutter/material.dart';
import 'package:post_app/ProfileScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page d\'accueil',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 70,
        ),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              Image.asset(
                'assets/images/logopost.png',
                width: 400,
                height: 280,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 70),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Matricule',
                  prefixIcon: const Icon(Icons.account_circle),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Color(0xFF171E5A),
                      width: 1.0,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Color(0xFF171E5A),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Color(0xFF171E5A),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Mot de Passe',
                  prefixIcon: const Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Color(0xFF171E5A),
                      width: 1.0,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Color(0xFF171E5A),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Color(0xFF171E5A),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              MaterialButton(
                elevation: 5.0,
                color: const Color(0xFF171E5A),
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 80,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onPressed: () {
                  // Redirection vers la page d'accueil
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfileScreen()),
                  );
                },
                child: const Text(
                  'Se Connecter',
                  style: TextStyle(
                    color: Color(0xFFFBBC08),
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Action when "Mot de passe oublié ?" is tapped
                },
                child: const Text(
                  'Mot de passe oublié ?',
                  style: TextStyle(
                    color: Color(0xFF171E5A),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
