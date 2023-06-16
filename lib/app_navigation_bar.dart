import 'package:flutter/material.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/common/utils/app_localizations_ext.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({
    Key? key,
    this.currentIndex = 0,
    this.onItemTapped,
  }) : super(key: key);

  final int currentIndex;
  final ValueChanged<int>? onItemTapped;

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  List<NavigationBarItem>? navigationItems;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        setState(() {
          navigationItems = [
            NavigationBarItem(name: context.l10n.tasks, url: 'tasks'),
            NavigationBarItem(name: context.l10n.projects, url: 'projects'),
            NavigationBarItem(name: context.l10n.teams, url: 'teams'),
          ];
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppStyle.darkBlue,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 64),
        itemCount: navigationItems?.length ?? 0,
        itemBuilder: (context, index) => InkWell(
          onTap: () => widget.onItemTapped?.call(index),
          child: _NavigationBarListItem(
            item: navigationItems?[index] ??
                NavigationBarItem(
                  name: '',
                  url: '',
                ),
            selected: index == widget.currentIndex,
          ),
        ),
        separatorBuilder: (context, index) => const Divider(
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
    this.selected = false,
  }) : super(key: key);

  final NavigationBarItem item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: selected ? Colors.amber.shade600 : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        item.name,
        style: const TextStyle(
          color: AppStyle.lightTextColor,
          fontSize: 18,
        ),
      ),
    );
  }
}

class NavigationBarItem {
  final String name;
  final String url;

  NavigationBarItem({required this.name, required this.url});
}
