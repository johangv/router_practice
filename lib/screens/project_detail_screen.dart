import 'package:flutter/material.dart';
import '../models/task_arguments.dart'; // Importa el modelo

class ProjectDetailScreen extends StatelessWidget {
  final String projectId;

  const ProjectDetailScreen({required this.projectId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de Proyecto')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.analytics, size: 80, color: Colors.blue),
              const SizedBox(height: 20),
              Text(
                'Viendo el Proyecto ID: $projectId',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Crear Tarea en este Proyecto'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade50,
                ),
                onPressed: () {
                  final initData = TaskInitializationModel(
                    projectId: projectId,
                    defaultAssignee: 'Jhoan Gil',
                    createdAt: DateTime.now(),
                  );

                  // Navegas y lo envías como argumento
                  Navigator.pushNamed(
                    context,
                    '/create-task',
                    arguments: initData,
                  );
                },
              ),

              const SizedBox(height: 15),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Volver al listado'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}