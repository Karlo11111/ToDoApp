// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged; 


  ToDoTile({super.key, 
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.blue[200]),
          child: Row(
            children: [
              //checkbox
              Checkbox(value: taskCompleted, onChanged: onChanged,
              
              ),
              //task name
              Text(taskName),
            ],
          ),
          )
       );
  }
}