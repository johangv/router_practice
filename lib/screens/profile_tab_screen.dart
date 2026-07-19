// lib/screens/profile_tab_screen.dart
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:router_practice/routes_config.dart';

@RoutePage()
class ProfileTabScreen extends StatelessWidget {
  const ProfileTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50, 
              child: Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 16),
            const Text(
              'Jhoan Gil', 
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            
            // 👇 ESTE BOTÓN ABRE LA SUB-PANTALLA Y ESPERA EL STRING
            ElevatedButton.icon(
              icon: const Icon(Icons.palette),
              label: const Text('Cambiar Tema (Esperar resultado)'),
              onPressed: () async {
                // Navegamos a la sub-ruta usando push para poder recibir el valor del pop
                final String? resultado = await context.pushRoute(
                  const ThemeSelectorRoute(),
                );
                
                if (context.mounted && resultado != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tema seleccionado: $resultado')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}