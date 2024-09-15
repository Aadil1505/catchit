import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        backgroundColor: ShadTheme.of(context).colorScheme.background,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 15, // Example number of items
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: ShadTheme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Image ${index + 1}',
                style: ShadTheme.of(context).textTheme.large,
              ),
            ),
          );
        },
      ),
    );
  }
}