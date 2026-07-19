import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:router_practice/routes_config.dart';

@RoutePage()
class ProjectListScreen extends StatelessWidget {
  const ProjectListScreen({super.key});

  // Lista de proyectos quemados (mock data) que estaba en tu HomeScreen
  final List<Map<String, String>> _projects = const [
    {'id': '101', 'name': 'Rediseño de Invoices'},
    {'id': '102', 'name': 'Refactor de Accesibilidad'},
    {'id': '103', 'name': 'Integración GoRouter'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Proyectos Activos')),
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
              // Navegación con AutoRoute usando la ruta hija que definimos
              context.navigateTo(
                ProjectsTabRoute(
                  children: [ProjectDetailRoute(projectId: project['id']!)],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
