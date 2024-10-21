import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CameraLaunchPage extends StatelessWidget {
  const CameraLaunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.camera_alt,
                size: 80,
              ),
              const SizedBox(height: 24),
              Text(
                'Camera Page',
                style: ShadTheme.of(context).textTheme.h3,
              ),
              const SizedBox(height: 16),
              Text(
                'Welcome to the camera page! You can launch the camera here to take pictures.',
                style: ShadTheme.of(context).textTheme.large,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ShadButton.outline(
                onPressed: () => context.go('/camera/capture'),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.camera),
                    SizedBox(width: 8),
                    Text('Launch Camera'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ShadCard(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Tips:',
                        style: ShadTheme.of(context).textTheme.h4,
                      ),
                      const SizedBox(height: 8),
                      const Text('• Ensure you have good lighting'),
                      const Text('• Hold your device steady'),
                      const Text('• Tap to focus before taking the picture'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}