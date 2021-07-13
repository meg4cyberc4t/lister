import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lister/models/createDeadlineBloc.dart';
import 'package:lister/variables.dart';

Future<DateTime?> showDeadlineCreateDialog(
    BuildContext context, DateTime? initialValue) {
  return showGeneralDialog(
    context: context,
    transitionDuration: DataDuration,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curvedValue = 1.0 - Curves.ease.transform(animation.value);
      return Transform(
        transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
        child: Opacity(opacity: animation.value, child: child),
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return Dialog(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: BlocProvider(
              create: (context) =>
                  CreateDeadlineBloc(initialValue ?? DateTime.now()),
              child: BlocBuilder<CreateDeadlineBloc, DateTime>(
                builder: (context, selectedDateTime) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Время завершения',
                          style: TextStyle(fontSize: fontSize['MiniMiddle'])),
                      SizedBox(height: 10),
                      AnimatedContainer(
                          duration: Duration(seconds: 1),
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: getAnimatedColor(selectedDateTime.hour),
                          ),
                          child: Container(
                            width: 100,
                            child: AnimatedSwitcher(
                              switchInCurve: Curves.linear,
                              switchOutCurve: Curves.linear,
                              duration: const Duration(milliseconds: 1),
                              child: (5 <= selectedDateTime.hour &&
                                      selectedDateTime.hour < 23)
                                  ? Container(
                                      key: const ValueKey(1),
                                      child: Image(
                                          image: AssetImage('assets/sun.png')))
                                  : Container(
                                      key: const ValueKey(2),
                                      child: Image(
                                          image:
                                              AssetImage('assets/moon.png'))),
                              transitionBuilder: (child, anim) {
                                return ScaleTransition(
                                  scale: anim,
                                  child: FadeTransition(
                                    opacity: anim,
                                    child: SlideTransition(
                                      position: anim.drive(
                                        Tween(
                                          begin: const Offset(0, 0),
                                          end: const Offset(0, 0),
                                        ),
                                      ),
                                      child: child,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: OutlinedButton(
                              child: Text(
                                  DateFormat('H:mm').format(selectedDateTime)),
                              onPressed: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime:
                                      TimeOfDay.fromDateTime(selectedDateTime),
                                );
                                if (pickedTime != null)
                                  BlocProvider.of<CreateDeadlineBloc>(context)
                                      .add(DateTime(
                                          selectedDateTime.year,
                                          selectedDateTime.month,
                                          selectedDateTime.day,
                                          pickedTime.hour,
                                          pickedTime.minute));
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 3,
                            child: OutlinedButton(
                              child: Text(DateFormat('yyyy.MM.dd')
                                  .format(selectedDateTime)),
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: selectedDateTime,
                                    firstDate: DateTime.now(),
                                    lastDate:
                                        DateTime(DateTime.now().year + 1000));
                                if (pickedDate != null)
                                  BlocProvider.of<CreateDeadlineBloc>(context)
                                      .add(DateTime(
                                          pickedDate.year,
                                          pickedDate.month,
                                          pickedDate.day,
                                          selectedDateTime.hour,
                                          selectedDateTime.minute));
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              child: Text('Отчистить'),
                              onPressed: () {
                                Navigator.pop(context, null);
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: OutlinedButton(
                              child: Text('Далее'),
                              onPressed: () {
                                Navigator.pop(context, selectedDateTime);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      );
    },
  );
}

Color getAnimatedColor(int hour) {
  if (23 <= hour && hour < 5)
    return Color(0xFF000000);
  else if (5 <= hour && hour < 11)
    return Color(0xFFFF6E4A);
  else if (11 <= hour && hour < 15)
    return Colors.blue;
  else
    return Color(0xFF252850);
}
