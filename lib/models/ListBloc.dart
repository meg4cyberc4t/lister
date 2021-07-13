import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lister/controllers/HiveController.dart';
import 'package:lister/models/note.dart';

class ListBloc extends Bloc<dynamic, List> {
  List thisList;

  ListBloc(initialState)
      : thisList = initialState,
        super(initialState);

  @override
  Stream<List> mapEventToState(dynamic event) async* {
    if (event is AddNote) {
      thisList.add(event.note);
    } else if (event is RemoveNote) {
      if (thisList.contains(event.note)) thisList.remove(event.note);
    } else if (event is RemoveNoteAt) {
      thisList.removeAt(event.position);
    }
    HiveController.saveMainList(thisList);
    yield thisList.toList();
  }
}

class AddNote {
  AddNote({required this.note});
  final Note note;
}

class RemoveNote {
  RemoveNote({required this.note});
  final Note note;
}

class RemoveNoteAt {
  RemoveNoteAt({required this.position});
  final int position;
}
