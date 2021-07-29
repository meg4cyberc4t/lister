import 'package:flutter_bloc/flutter_bloc.dart';

class SubtaskBLoC extends Bloc<List, List> {
  SubtaskBLoC(List initialState) : super(initialState);

  @override
  Stream<List> mapEventToState(List event) async* {
    yield event.toList();
  }
}
