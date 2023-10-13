import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController txtController = TextEditingController();

  CollectionReference student =
      FirebaseFirestore.instance.collection('student');

  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FireStore"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: txtController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Text"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              student.add({"name":txtController.text});
            },
            child: Text("Save"),
            color: Colors.green,
          ),
          SizedBox(
            height: 20,
          ),
          // MaterialButton(
          //   onPressed: () {
          //     student.doc("AfbFCwOTEn8iOOgmTuC9").get().then((value) {
          //       setState(() {
          //         name = value["name"];
          //       });
          //     });
          //   },
          //   child: Text(name),
          //   color: Colors.green,
          // ),
        ],
      ),
    );
  }
}
