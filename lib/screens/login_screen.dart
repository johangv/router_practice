import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:router_practice/routes_config.dart';

@RoutePage()
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
                  context.router.replaceAll([const HomeRoute()]);
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