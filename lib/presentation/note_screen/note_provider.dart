import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wulap_application/presentation/note_screen/note.dart';

class NoteProvider extends ChangeNotifier {
  late Box<Note> _noteBox;
  VoidCallback? _listener;
  DateTime? _selectedDate;

  List<Note> get notes => _noteBox.values.toList();
  DateTime? get selectedDate => _selectedDate;

  Future<void> initialize() async {
    _noteBox = await Hive.openBox<Note>('notes');
    notifyListeners();
  }

  void setListener(VoidCallback listener) {
    _listener = listener;
  }

  Future<void> addNote(Note note) async {
    await _noteBox.add(note);
    notifyListeners();
  }

  Future<void> updateNote(int index, Note updatedNote) async {
    await _noteBox.putAt(index, updatedNote);
    notifyListeners();
  }

  Future<void> deleteNote(int index) async {
    await _noteBox.deleteAt(index);
    notifyListeners();
  }

  void setSelectedDate(DateTime? date) {
    _selectedDate = date;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
    _listener?.call();
  }
}
