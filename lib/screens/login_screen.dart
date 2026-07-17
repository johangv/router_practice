import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ingresar')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock_person, size: 80, color: Colors.teal),
              const SizedBox(height: 20),
              const Text(
                'Bienvenido a TrackMyWork',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Navegación clásica limpiando el historial para que no puedan volver al login
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: const Text('Simular Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}