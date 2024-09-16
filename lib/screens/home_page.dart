import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).padding.top),
        child: SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
      ),
      // floatingActionButton:  
      // FloatingActionButton(
      //   onPressed: () => context.go('/camera/capture'),
      //   child: const Icon(LucideIcons.camera),
      //   ),
      body: SingleChildScrollView(
        primary: false,
        child: Column(
          children: [
            _buildCard(
              context,
              'Create new event',
              'Create an event to begin sharing photos!',
              'https://images.unsplash.com/photo-1464366400600-7168b8af9bc3?q=80&w=2969&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
            _buildCard(
              context,
              'Join event',
              'Join an existing event to share your photos!',
              'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
            _buildCard(
              context,
              'View gallery',
              'Browse through your shared memories',
              'https://images.unsplash.com/photo-1497911270199-1c552ee64aa4?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, String title, String description, String imageUrl) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: ShadTheme.of(context).colorScheme.card,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: ShadTheme.of(context).textTheme.h3,
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: ShadTheme.of(context).textTheme.muted,
                ),
                const SizedBox(height: 16),
                ShadButton(
                  child: Text('Go to ${title.toLowerCase()}'),
                  onPressed: () {
                    switch (title) {
                      case 'Create new event':
                        context.go('/home/create');
                        break;
                      case 'Join event':
                        context.go('/home/join');
                        break;
                      case 'View gallery':
                        context.go('/home/gallery');
                        break;
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}