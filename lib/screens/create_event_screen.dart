import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
        const Center(child: Text('Create Event Screen')),
    );
  }
}