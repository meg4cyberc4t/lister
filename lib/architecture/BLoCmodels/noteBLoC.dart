import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lister/architecture/note.dart';

class NoteBloc extends Bloc<Note, Note> {
  Note thisNote;
  NoteBloc(initialState)
      : thisNote = initialState,
        super(initialState);

  @override
  Stream<Note> mapEventToState(Note newNote) async* {
    thisNote = newNote.copyWith();
    yield thisNote;
  }
}
