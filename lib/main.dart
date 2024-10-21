import 'package:catchit/screens/login/login_page.dart';
import 'package:catchit/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/scaffold_with_nav_bar.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'screens/home/home_page.dart';
import 'screens/home/create_event_screen.dart';
import 'screens/home/join_event_screen.dart';
import 'screens/home/gallery_screen.dart';
import 'screens/camera/camera_page.dart';
import 'screens/camera/camera_launch_page.dart'; // New import

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
    initialLocation: '/login',
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
                    const ProfilePage(),
                // routes: <RouteBase>[
                //   GoRoute(
                //     path: 'detail',
                //     parentNavigatorKey: _rootNavigatorKey,
                //     builder: (BuildContext context, GoRouterState state) =>
                //         const ProfilePage(),
                //   ),
                // ],
              ),
            ],
          ),

          // Login branch
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/login',
                builder: (BuildContext context, GoRouterState state) =>
                    const LoginPage()
                // routes: <RouteBase>[
                //   GoRoute(
                //     path: 'detail',
                //     parentNavigatorKey: _rootNavigatorKey,
                //     builder: (BuildContext context, GoRouterState state) =>
                //         const ProfilePage(),
                //   ),
                // ],
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ShadApp.materialRouter(
      debugShowCheckedModeBanner: false,
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadSlateColorScheme.dark(),
      ),
      routerConfig: _router,
    );
  }
}