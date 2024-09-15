import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Event')),
      body:
        Dismissible(
          key: const Key('create_page'),
          direction: DismissDirection.horizontal,
          onDismissed: (_) => context.go('/home'),
          child: 
            const Center(child: Text('Create Event Screen')),
        )
    );
  }
}