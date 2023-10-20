import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskListPage extends StatelessWidget {
  TaskListPage({super.key});
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks")
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        
        stream: db
          .collection('tasks')
          .orderBy('name')
          .where('finished', isEqualTo: false)
          .snapshots(),

        builder: (context, snapshot) {

          if(!snapshot.hasData)
            return CircularProgressIndicator();

          var docs = snapshot.data!.docs;

          return ListView(
            children: docs.map((doc) => Dismissible(
              background: Container(color: Colors.red),
              key: Key(doc.id),
              onDismissed: (_) => doc.reference.delete(),
              child: CheckboxListTile(
                  title: Text(doc['name']),
                  value: doc['finished'],
                  onChanged: (value) => doc.reference.update({'finished': value!}),
                ),
            )).toList(),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed('/create'),
      ),
    );
  }
}




