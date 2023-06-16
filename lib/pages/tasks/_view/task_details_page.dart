import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/common/app_style.dart';

import '../../../common/utils/date_formatter.dart';
import '../../../model/task.dart';

class TaskDetailPage extends ConsumerWidget {
  const TaskDetailPage({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Task ${task.id}',
            style: const TextStyle(fontSize: 24),
          ),
          Divider(
            thickness: 1,
            color: AppStyle.mediumBlue.withOpacity(0.5),
          ),
          const SizedBox(height: 36),
          Text(
            formattedDate(task),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              height: 20 / 14,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            task.description ?? '',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
