import 'package:flutter_bloc/flutter_bloc.dart';

class CheckBLoC extends Bloc<bool, bool> {
  CheckBLoC(initState) : super(initState);

  @override
  Stream<bool> mapEventToState(bool event) async* {
    yield event;
  }
}
