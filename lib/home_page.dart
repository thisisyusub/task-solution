import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_app/app_navigation_bar.dart';

// This class does not have to be used. It should be replaced with class
// handling navigation using go_router package
class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);

  final StatefulNavigationShell navigationShell;

  void goTo(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 200,
              maxWidth: 300,
            ),
            child: AppNavigationBar(
              onItemTapped: goTo,
              currentIndex: navigationShell.currentIndex,
            ),
          ),
          Expanded(child: navigationShell),
        ],
      ),
    );
  }
}
