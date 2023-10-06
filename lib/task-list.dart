import 'package:flutter/material.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks")
      ),
      body: ListView(
        children: [
          CheckboxListTile(
            title: Text("Task 1"),
            value: true,
            onChanged: (value) {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed('/create'),
      ),
    );
  }
}




