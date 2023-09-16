// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
        child: Container(
          color: Colors.blue[200],
          child: const Text("aaaa"),
          )
       );
  }
}