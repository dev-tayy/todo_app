import 'dart:collection';

import 'package:flutter/material.dart';
import 'screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'models/tasks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}

//using provider state management.

class Data extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Buy Bread'),
  ];

  int get taskCount {
    //gets the number of tasks
    return _tasks.length;
  }

//creates an unmodifiable list so as not to get the _tasks property tampered with
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

//adds new task to existing task list
  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

//updating task checkbox

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
//deleting task from tasks list
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
