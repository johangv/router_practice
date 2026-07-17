import 'package:flutter/material.dart';
import '../models/task_arguments.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final initData = ModalRoute.of(context)!.settings.arguments as TaskInitializationModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Tarea'),
        backgroundColor: Colors.teal.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Asignar al Proyecto ID: ${initData.projectId}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Responsable asignado: ${initData.defaultAssignee}'),
            Text('Fecha de creación: ${initData.createdAt.toString().split(' ').first}'),
            const SizedBox(height: 30),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Título de la tarea',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Simular que guardamos y regresar
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('¡Tarea creada exitosamente!')),
                  );
                },
                child: const Text('Guardar Tarea'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}