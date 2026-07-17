// lib/screens/projects_tab_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProjectsTabScreen extends StatelessWidget {
  const ProjectsTabScreen({super.key});

  // Lista de proyectos quemados (mock data) que estaba en tu HomeScreen
  final List<Map<String, String>> _projects = const [
    {'id': '101', 'name': 'Rediseño de Invoices'},
    {'id': '102', 'name': 'Refactor de Accesibilidad'},
    {'id': '103', 'name': 'Integración GoRouter'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proyectos Activos'),
      ),
      body: ListView.builder(
        itemCount: _projects.length,
        itemBuilder: (context, index) {
          final project = _projects[index];
          return ListTile(
            leading: const Icon(Icons.folder, color: Colors.amber),
            title: Text(project['name']!),
            subtitle: Text('ID: ${project['id']}'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navegación con GoRouter usando la ruta hija que definimos
              context.go('/home/projects/detail/${project['id']}');
            },
          );
        },
      ),
    );
  }
}