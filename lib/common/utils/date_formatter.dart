import 'package:intl/intl.dart';
import 'package:task_list_app/model/task.dart';

String formattedDate(Task task) {
  if (task.dateTime != null) {
    return DateFormat('dd/MM, hh:mm').format(task.dateTime!);
  }

  return '';
}
