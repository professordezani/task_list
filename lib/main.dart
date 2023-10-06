import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/task-create.dart';
import 'package:todo_list/task-list.dart';

const firebaseConfig = FirebaseOptions(
  apiKey: "AIzaSyDml-vBy_OkzcfH83pw0YPz1kc-QYWtFcE",
  authDomain: "tasklist-b01ae.firebaseapp.com",
  projectId: "tasklist-b01ae",
  storageBucket: "tasklist-b01ae.appspot.com",
  messagingSenderId: "46802841767",
  appId: "1:46802841767:android:3b79e248cd487f1664eb82"
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: firebaseConfig);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/list":(context) => TaskListPage(),
        "/create":(context) => TaskCreatePage(),
      },
      initialRoute: '/list',
    );
  }
}