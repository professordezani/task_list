import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskCreatePage extends StatelessWidget {
  TaskCreatePage({super.key});
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Task")
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Description"
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Salvar"),
                onPressed: () => db.collection('tasks').add({'name': 'Task 2'})//Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}