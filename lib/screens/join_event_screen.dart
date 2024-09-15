import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class JoinEventScreen extends StatelessWidget {
  const JoinEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Event'),
        backgroundColor: ShadTheme.of(context).colorScheme.background,
      ),
      body: 
        Dismissible(
          key: const Key('create_page'),
          direction: DismissDirection.horizontal,
          onDismissed: (_) => context.go('/home'),
          child: 
      Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter Event Code',
                style: ShadTheme.of(context).textTheme.h3,
              ),
              const SizedBox(height: 16),
              const ShadInput(
                placeholder: Text('Event Code'),
              ),
              const SizedBox(height: 16),
              ShadButton(
                child: const Text('Join Event'),
                onPressed: () {
                  // TODO: Implement join event logic
                },
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}