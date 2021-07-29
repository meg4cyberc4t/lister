import 'package:flutter_bloc/flutter_bloc.dart';

class CreateDeadlineBloc extends Bloc<DateTime, DateTime> {
  DateTime _selectedDateTime;
  CreateDeadlineBloc(initialState)
      : _selectedDateTime = initialState,
        super(initialState);

  @override
  Stream<DateTime> mapEventToState(DateTime event) async* {
    _selectedDateTime = event;
    yield _selectedDateTime;
  }
}
