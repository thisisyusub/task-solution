import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/common/utils/app_localizations_ext.dart';
import 'package:task_list_app/pages/tasks/_view/task_details_page.dart';
import 'package:task_list_app/pages/tasks/_view/widgets/task_item.dart';

import '../../../bloc/tasks_notifier.dart';
import '../../../common/app_style.dart';
import '../../../model/task.dart';

class TasksPage extends ConsumerWidget {
  const TasksPage({
    Key? key,
    this.taskId,
  }) : super(key: key);

  final String? taskId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(tasksProvider).when(
          data: (tasks) {
            Task? task;

            if (taskId != null) {
              task = tasks.firstWhere((task) => task.id == taskId, orElse: () {
                return Task(
                  id: '',
                  title: 'Undefined',
                  dateTime: null,
                  description: 'There is no task with id $taskId',
                );
              });
            }

            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.tasks,
                          style: const TextStyle(fontSize: 24),
                        ),
                        Divider(
                          thickness: 1,
                          color: AppStyle.mediumBlue.withOpacity(0.5),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: SizedBox(
                            width: 500,
                            child: ListView.separated(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              itemCount: tasks.length,
                              itemBuilder: (context, index) {
                                return TaskItem(
                                  task: tasks[index],
                                  selected: task != null &&
                                      tasks[index].id == task.id,
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const VerticalDivider(thickness: 2, width: 0),
                if (task != null) Expanded(child: TaskDetailPage(task: task)),
              ],
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Center(
            child: Text(
              error.toString(),
            ),
          ),
        );
  }
}
