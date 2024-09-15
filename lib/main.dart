import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/root_screen.dart';
import 'screens/details_screen.dart';
import 'screens/scaffold_with_nav_bar.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'screens/home_page.dart';
import 'screens/create_event_screen.dart';
import 'screens/join_event_screen.dart';
import 'screens/gallery_screen.dart';
import 'screens/camera_page.dart';
import 'screens/camera_launch_page.dart'; // New import

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          // Home branch
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/home',
                builder: (BuildContext context, GoRouterState state) =>
                    const HomePage(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'create',
                    builder: (BuildContext context, GoRouterState state) =>
                        const CreateEventScreen(),
                  ),
                  GoRoute(
                    path: 'join',
                    builder: (BuildContext context, GoRouterState state) =>
                        const JoinEventScreen(),
                  ),
                  GoRoute(
                    path: 'gallery',
                    builder: (BuildContext context, GoRouterState state) =>
                        const GalleryScreen(),
                  ),
                ],
              ),
            ],
          ),

          // Camera branch
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/camera',
                builder: (BuildContext context, GoRouterState state) =>
                    const CameraLaunchPage(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'capture',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (BuildContext context, GoRouterState state) =>
                        const CameraPage(),
                  ),
                ],
              ),
            ],
          ),

          // Profile branch
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/profile',
                builder: (BuildContext context, GoRouterState state) =>
                    const RootScreen(
                  label: 'Profile',
                  detailsPath: '/profile/details',
                ),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (BuildContext context, GoRouterState state) =>
                        const DetailsScreen(label: 'Profile Details'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ShadApp.router(
      debugShowCheckedModeBanner: false,
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadSlateColorScheme.dark(),
      ),
      routerConfig: _router,
    );
  }
}