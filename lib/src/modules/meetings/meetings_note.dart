import 'package:angular_emulation/src/models/note.dart';
import 'package:demo_views/demo_views.dart';
import 'package:flutter/material.dart';

class MeetingNote extends StatelessWidget {
  final Note note;
  MeetingNote({super.key, required this.note});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MD Meeting Note"),
        elevation: 0,
      ),
      body: /*Column(
        
        children: [
          Text("Meeting Note", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, ), textAlign: TextAlign.center,),*/
          MarkdownView(content: note.content),
        /*],
      ),*/
    );
  }
}