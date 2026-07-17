// lib/screens/theme_selector_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThemeSelectorScreen extends StatelessWidget {
  const ThemeSelectorScreen({super.key});

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
              'Elige tu estilo visual:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.wb_sunny, color: Colors.orange),
              title: const Text('Modo Claro'),
              onTap: () => context.pop('Modo Claro'), // Retorna el String
            ),
            ListTile(
              leading: const Icon(Icons.nightlight_round, color: Colors.indigo),
              title: const Text('Modo Oscuro'),
              onTap: () => context.pop('Modo Oscuro'), // Retorna el String
            ),
          ],
        ),
      ),
    );
  }
}