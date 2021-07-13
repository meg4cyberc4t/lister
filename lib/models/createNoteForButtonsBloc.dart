import 'package:flutter_bloc/flutter_bloc.dart';

enum CreateNoteForButtonsEvent {
  DeadlineON,
  DeadlineOFF,
  DesciptionON,
  DesciptionOFF,
  SubtasksON,
  SubtasksOFF,
  AllOFF,
  AllON,
}

class CreateNoteForButtonsBloc
    extends Bloc<CreateNoteForButtonsEvent, List<bool>> {
  List<bool> state = [false, false, false];
  CreateNoteForButtonsBloc() : super([false, false, false]);

  @override
  Stream<List<bool>> mapEventToState(CreateNoteForButtonsEvent event) async* {
    switch (event) {
      case CreateNoteForButtonsEvent.DeadlineON:
        state[0] = true;
        break;
      case CreateNoteForButtonsEvent.DeadlineOFF:
        state[0] = false;
        break;
      case CreateNoteForButtonsEvent.DesciptionON:
        state[1] = true;
        break;
      case CreateNoteForButtonsEvent.DesciptionOFF:
        state[1] = false;
        break;
      case CreateNoteForButtonsEvent.SubtasksON:
        state[2] = true;
        break;
      case CreateNoteForButtonsEvent.SubtasksOFF:
        state[2] = false;
        break;
      case CreateNoteForButtonsEvent.AllOFF:
        state = [false, false, false];
        break;
      case CreateNoteForButtonsEvent.AllON:
        state = [true, true, true];
        break;
      default:
        break;
    }
    yield state.toList();
  }
}
