// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names


import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatefulWidget {
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
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {

  void _showDatePicker(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2020), 
      lastDate: DateTime(2025)
      );
  }


  @override
  Widget build(BuildContext context) {
      return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, top: 25, bottom: 12.5),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(), 
            children: [
              SlidableAction(
                onPressed: widget.deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red,
                )
            ]
            ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.blue[200]),
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //checkbox
                Checkbox(value: widget.taskCompleted, onChanged: widget.onChanged,
                checkColor: Colors.black,
                ),
                //task name
                Expanded(
                  child: Text(
                    widget.taskName, 
                    style: TextStyle(decoration: widget.taskCompleted ? TextDecoration.lineThrough : TextDecoration.none, fontSize: 20),
                  ),
                ),
                MaterialButton(
                  color: Colors.white,
                  onPressed: _showDatePicker,
                  child: const Text("REMIND", style: TextStyle(fontSize: 15),),
                )
              ],
            ),
            ),
        )
       ); 
   
  }
}