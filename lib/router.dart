import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'home_page.dart';
import 'pages/projects/_view/projects_page.dart';
import 'pages/tasks/_view/tasks_page.dart';
import 'pages/teams/_view/teams_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorTasksKey = GlobalKey<NavigatorState>(debugLabel: 'Tasks');
final _shellNavigatorProjectsKey = GlobalKey<NavigatorState>(
  debugLabel: 'Projects',
);
final _shellNavigatorTeamsKey = GlobalKey<NavigatorState>(debugLabel: 'Teams');

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/tasks',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return HomePage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorTasksKey,
          routes: [
            GoRoute(
              path: '/tasks',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: TasksPage(),
              ),
              routes: [
                GoRoute(
                  path: ':id',
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: TasksPage(taskId: state.pathParameters['id']!),
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProjectsKey,
          routes: [
            GoRoute(
              path: '/projects',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProjectsPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorTeamsKey,
          routes: [
            GoRoute(
              path: '/teams',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: TeamsPage(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
