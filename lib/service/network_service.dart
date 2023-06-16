import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/model/task.dart';

final networkServiceProvider = Provider.autoDispose<NetworkService>((ref) {
  return NetworkService();
});

class NetworkService {
  NetworkService();

  // generate lorem ipsum

  Future<List<Task>> getTasks() async {
    final now = DateTime.now();
    return [
      Task(
        id: '1',
        title: 'Read emails from mailbox',
        dateTime: now,
        description:
            r'''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
      ),
      Task(
        id: '2',
        title: 'Check latest news on Flutter',
        dateTime: now,
        description: 'Lorem Ipsum 1',
      ),
      Task(
        id: '3',
        title: 'Have a call with Flutter team',
        dateTime: now,
        description: 'Lorem Ipsum 2',
      ),
      Task(
        id: '4',
        title: 'Work on application performance',
        dateTime: now,
        description: 'Lorem Ipsum 3',
      ),
      Task(
        id: '5',
        title: 'Plan work for next week',
        dateTime: now,
        description: 'Lorem Ipsum 4',
      ),
      Task(
        id: '6',
        title: 'Order lunch',
        dateTime: now,
        description: 'Lorem Ipsum 5',
      ),
      Task(
        id: '7',
        title: 'Create an invoice for last month',
        dateTime: now,
        description: 'Lorem Ipsum 6',
      ),
    ];
  }
}
