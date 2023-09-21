import 'dart:developer';

import 'package:angular_emulation/src/core/providers.dart';
import 'package:angular_emulation/src/models/note.dart';
import 'package:angular_emulation/src/services/meetings_service.dart';
import 'package:demo_views/demo_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MeetingsCalendar extends ConsumerWidget {
  const MeetingsCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final MeetingsService meetingsService = ref.watch(meetingsServiceProvider);

    void save(String content){
      meetingsService.getNote(DateTime(2023,9,19)).then((value){
        value.content = content;
        return value;
      });
    }

    void toNote(){
      meetingsService.getNote(DateTime(2023,9,19)).then((value){
        return value;
      });
      inspect("Llega");
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
        FutureBuilder(
          future: meetingsService.getNote(DateTime(2023,9,19)),
          builder: (context, snapshot) {
            if ((snapshot.hasData) && (snapshot.connectionState == ConnectionState.done)){
              return MarkdownEditor(content: (snapshot.data as Note).content,save: save,);
            } else {
              return const CircularProgressIndicator();
            }
          }
        )
        // MeetingNote(note: meet,)
      ));
    }


    return Scaffold(
      body: Column(
        children: [
          const ScreenTitle(title: "Meetings Calendar"),
          CalendarNotes(toNote: toNote,),
        ],
      ),
    );
  }
}