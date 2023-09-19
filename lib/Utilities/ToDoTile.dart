// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names


import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged; 
  Function(BuildContext)? deleteFunction;


  ToDoTile({super.key, 
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {

      
      return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, top: 25, bottom: 12.5),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(), 
            children: [
              SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red,
                )
            ]
            ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.blue[200]),
            
            child: Row(
              children: [
                //checkbox
                Checkbox(value: taskCompleted, onChanged: onChanged,
                checkColor: Colors.black,
                ),
                //task name
                Text(
                  taskName, 
                  style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none, fontSize: 25),
                ),
              ],
            ),
            ),
        )
       ); 
   
  }


 
}