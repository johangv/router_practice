import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:router_practice/routes_config.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  }); // 👈 Ya no requiere recibir el shell por parámetro

  @override
  Widget build(BuildContext context) {
    // AutoTabsScaffold es un wrapper genial de auto_router que une un Scaffold 
    // con un TabsRouter de forma automática.
    return AutoTabsScaffold(
      // 1. Declaras las pestañas (ramas) en el mismo orden del BottomNavigationBar
      routes: const [
        ProjectsTabRoute(), // 👈 Reemplaza por el nombre generado de tu pantalla de Proyectos
        ProfileTabRoute(), // 👈 Reemplaza por el nombre generado de tu pantalla de Perfil
      ],

      // 2. El BottomNavigationBar se configura mediante el bottomNavigationBuilder
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          // Leemos el índice actual directamente del TabsRouter de auto_router
          currentIndex: tabsRouter.activeIndex,

          onTap: (int index) {
            // Si el usuario toca la pestaña que ya está activa, auto_router de forma
            // nativa hace el "pop" automático hasta la raíz de esa rama.
            tabsRouter.setActiveIndex(index);
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
        );
      },
    );
  }
}