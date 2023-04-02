import 'package:flutter/material.dart';
import 'package:todo/widgets/task_tile.dart';
import 'package:todo/model/task_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(task.name, task.isDone, (checkboxState) {
              taskData.updateTask(task);
              /*setState(
                () {
                  Provider.of<TaskData>(context).tasks[index].toggleDone();
                },
              );*/
            }, () {
              taskData.deleteTask(task);
            });
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
