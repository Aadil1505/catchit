import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CameraLaunchPage extends StatelessWidget {
  const CameraLaunchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShadButton.outline(
        onPressed: () => context.go('/camera/capture'),
        child: const Text('Launch Camera'),
      ),
    );
  }
}