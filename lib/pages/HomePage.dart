// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todoapp/Utilities/ToDoTile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //list of todo Items
  List toDoList = [
    ["Make Tutorial", false],
    ["Exercise", false]

  ];


  //checkbox change method
  void CheckBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1]= value!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: const Text("TO DO APP"),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 70,
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          
        },


      ),

      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder:(context , index){
          return ToDoTile(
            taskName: toDoList[index][0], 
            taskCompleted: toDoList[index][1], 
            onChanged: (value) {
              CheckBoxChanged(value, index);
            },
          );
        }
      )
    );
  }
}