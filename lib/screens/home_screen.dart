import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Lista de proyectos quemados (mock data)
  final List<Map<String, String>> _projects = [
    {'id': '101', 'name': 'Rediseño de Invoices'},
    {'id': '102', 'name': 'Refactor de Accesibilidad'},
    {'id': '103', 'name': 'Integración GoRouter'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Cerrar sesión y volver al login
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      // Mostramos la pestaña correspondiente
      body: _currentIndex == 0 ? _buildProjectsTab() : _buildProfileTab(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Proyectos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }

  // PESTAÑA DE PROYECTOS (Paso de parámetros)
  Widget _buildProjectsTab() {
    return ListView.builder(
      itemCount: _projects.length,
      itemBuilder: (context, index) {
        final project = _projects[index];
        return ListTile(
          leading: const Icon(Icons.folder, color: Colors.amber),
          title: Text(project['name']!),
          subtitle: Text('ID: ${project['id']}'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            // Navegamos al detalle pasando el ID en la ruta
            Navigator.pushNamed(context, '/project-detail/${project['id']}');
          },
        );
      },
    );
  }

  // PESTAÑA DE PERFIL (Retorno de datos esperando un resultado)
  Widget _buildProfileTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
          const SizedBox(height: 16),
          const Text('Jhoan Gil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            icon: const Icon(Icons.settings),
            label: const Text('Ir a Configuración (Esperar resultado)'),
            onPressed: () async {
              // Esperamos de forma asíncrona que la pantalla de perfil retorne algo
              final resultado = await Navigator.pushNamed(context, '/profile');
              
              if (context.mounted && resultado != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tema seleccionado: $resultado')),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}