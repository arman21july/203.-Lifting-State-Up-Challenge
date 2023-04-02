import 'package:flutter/material.dart';
import 'package:todo/widgets/task_tile.dart';
import 'package:todo/model/tasks.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;

  TaskList(this.tasks);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          widget.tasks[index].name,
          widget.tasks[index].isDone,
          (checkboxState) {
            setState(
              () {
                widget.tasks[index].toggleDone();
              },
            );
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
