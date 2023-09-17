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
    //controller for input field
    late TextEditingController controller;

    @override
    void initState(){
      super.initState();

      controller = TextEditingController();
    }

    @override
    void dispose(){
      controller.dispose();

      super.dispose();
    }


  //list of todo Items
  static List toDoList = 
  [
    
  ];


  //checkbox change method
  void CheckBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1]= !toDoList[index][1];
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
          DialogBox(context);
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

  // ignore: non_constant_identifier_names
  Future<dynamic> DialogBox(BuildContext context) {
    return showDialog(context: context, builder: (context) =>  AlertDialog(
          title : const Text('Add New Task'),
          content: TextField(
            autofocus: true,
            controller: controller,
            decoration: const InputDecoration(hintText: "Enter your task", border: OutlineInputBorder(borderRadius: BorderRadius.horizontal()))),
          actions: [
            TextButton(
              //SUBMIT  BUTTON
              child: const Text("SUBMIT"),
              onPressed: () 
              {
                setState(() {
                  toDoList.add([controller.text, false]);
                  
                  controller.clear();
                });
                
                //close the dialog
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              //CANCEL BUTTON
              child: const Text("CANCEL"),
              onPressed: () 
              {
                setState(() {
                  controller.clear();
                });
                //close the dialog
                Navigator.of(context).pop();
              },
            )


          ],
          ),
        );
  }
}