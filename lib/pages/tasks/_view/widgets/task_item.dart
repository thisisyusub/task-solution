import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/utils/date_formatter.dart';
import '../../../../model/task.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
    this.selected = false,
  });

  final Task task;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () {
          context.go('/tasks/${task.id}');
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  task.title ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                formattedDate(task),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
