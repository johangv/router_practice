import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seleccionar Tema')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selecciona un modo de visualización:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.wb_sunny),
              title: const Text('Modo Claro'),
              onTap: () => context.pop('Modo Claro'), // Retorna valor
            ),
            ListTile(
              leading: const Icon(Icons.nightlight_round),
              title: const Text('Modo Oscuro'),
              onTap: () => context.pop('Modo Oscuro'), // Retorna valor
            ),
          ],
        ),
      ),
    );
  }
}