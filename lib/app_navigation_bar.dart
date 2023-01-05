import 'package:flutter/material.dart';
import 'package:task_list_app/common/app_style.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppStyle.darkBlue,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 64),
        itemCount: navigationBarItems.length,
        itemBuilder: (context, index) => _NavigationBarListItem(
          item: navigationBarItems[index],
        ),
        separatorBuilder: (context, index) => Divider(
          color: AppStyle.mediumBlue,
          height: 1,
          endIndent: 16,
          indent: 16,
        ),
      ),
    );
  }
}

class _NavigationBarListItem extends StatelessWidget {
  const _NavigationBarListItem({
    Key? key,
    required this.item,
  }) : super(key: key);
  final NavigationBarItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        item.name,
        style: TextStyle(
          color: AppStyle.lightTextColor,
          fontSize: 18,
        ),
      ),
    );
  }
}

final navigationBarItems = [
  // TODO: labels should be in app localization file
  NavigationBarItem(name: 'Tasks', url: 'tasks'),
  NavigationBarItem(name: 'Projects', url: 'projects'),
  NavigationBarItem(name: 'Teams', url: 'teams'),
];

class NavigationBarItem {
  final String name;
  final String url;

  NavigationBarItem({required this.name, required this.url});
}
