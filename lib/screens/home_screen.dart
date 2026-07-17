import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  // Recibimos el controlador de pestañas que nos da GoRouter
  final StatefulNavigationShell navigationShell;

  const HomeScreen({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // El body es el propio shell de navegación que GoRouter se encarga de renderizar e indexar
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        // Leemos el índice actual directamente de la rama activa de GoRouter
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) {
          // Cambiamos de pestaña de forma segura con la API de GoRouter
          navigationShell.goBranch(
            index,
            // Si el usuario toca la pestaña que ya está activa, regresa a la raíz de esa pestaña
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            activeIcon: Icon(Icons.work),
            label: 'Proyectos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}