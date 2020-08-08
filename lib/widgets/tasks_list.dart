import 'package:flutter/material.dart';
import '../widgets/tasks_tile.dart';
import 'package:todo_app/main.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>( //Refactored !--using Consumer Data in order to eliminate constant use of Provider.of(context)
        builder: (context, taskData, child) => ListView.builder( //taskData now standing in place of Provider.of<Data>(context)
              itemBuilder: (context, index) {
                final task = taskData.tasks[index];
                return TaskTile(
                    taskTitle: task.name,
                    isChecked: task.isDone,
                    //checkbox controls the state of the checkbox
                    checkboxCallback: (bool checkboxState) {
                      taskData.updateTask(task);
                    },
                    //onlongpress deletes task from task list
                    longPressCallback: (){
                      taskData.deleteTask(task);
                    } ,);
              },
              itemCount: taskData.taskCount,
            ));
  }
}
