import 'dart:developer';

import 'package:angular_emulation/src/models/note.dart';

class MeetingsService {

  List<Note> meetingNotes = [
    Note(date: DateTime(2023, 9, 19), content: '# General Meeting\nToday we had a meeting about the goals reached\n- [x] Show markdown\n- [ ] Edit markdown'),
  ];

  Future<Note> getNote(DateTime dateReq) {
    inspect(dateReq);
    try {
      return Future(() => meetingNotes.where((element) => element.date == dateReq).first);
    } catch (e) {
      throw Exception("Cant get the note");
    }
  }

  Future<List<Note>> getNotes() {
    return Future(() => meetingNotes);
  }
}