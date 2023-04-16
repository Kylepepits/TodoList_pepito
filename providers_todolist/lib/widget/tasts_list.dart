import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list_app/modal/task_data.dart';
import 'package:todo_list_app/widget/tasks_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, tasksProvider, child) {
        return ListView.builder(
          itemCount: tasksProvider.taskLength,
          itemBuilder: (context, index) {
            final task = tasksProvider.tasks[index];
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (_) {
                tasksProvider.deleteTask(task);
              },
              child: TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState) {
                  tasksProvider.updateTasks(task);
                },
              ),
            );
          },
        );
      },
    );
  }
}
