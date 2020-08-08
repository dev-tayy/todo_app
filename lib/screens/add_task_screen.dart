import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/main.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController _controller = TextEditingController();

  bool _validate = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      color: Color(0XFF757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30.0,
                  )),
              TextField(
                autofocus: true,
                controller: _controller,
                decoration: InputDecoration(
                    errorText: _validate ? "This field can't be empty" : null), 
                textAlign: TextAlign.center,
                onChanged: (newText) {
                  //storing the inputted text(task) into newTaskTitle
                  newTaskTitle = newText;
                },
              ),
              SizedBox(height: 10.0),
              FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                child: Text('Add',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    )),
                color: Colors.lightBlueAccent,
                onPressed: () {
                  //adds task to the list of tasks
                  setState(() {
                    if (_controller.text.isEmpty) {
                      _validate = true;
                    } else {
                      _validate = false;
                      Provider.of<Data>(context, listen: false)
                          .addTask(newTaskTitle);
                      Navigator.pop(context);
                    }
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
