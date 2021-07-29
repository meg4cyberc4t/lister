import 'package:flutter_bloc/flutter_bloc.dart';

class BoolBLoC extends Bloc<bool, bool> {
  BoolBLoC(initState) : super(initState);

  @override
  Stream<bool> mapEventToState(bool event) async* {
    yield event;
  }
}
