import 'package:flutter_bloc/flutter_bloc.dart';

class SubtasksBLoC extends Bloc<List, List> {
  SubtasksBLoC(initialState) : super(initialState);

  @override
  Stream<List> mapEventToState(List event) async* {
    yield event.toList();
  }
}
