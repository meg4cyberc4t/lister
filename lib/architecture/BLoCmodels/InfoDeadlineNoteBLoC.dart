import 'package:flutter_bloc/flutter_bloc.dart';

class InfoDeadlineNoteBLoC extends Bloc<DateTime?, DateTime?> {
  InfoDeadlineNoteBLoC(initialState) : super(initialState);

  @override
  Stream<DateTime?> mapEventToState(DateTime? event) async* {
    yield event;
  }
}
