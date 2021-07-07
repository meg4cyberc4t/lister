import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lister/components/myWidgets/MyOutlinedButton.dart';
import 'package:lister/components/myWidgets/MyOutlinedButtonIcon.dart';
import 'package:lister/components/controllers/ListerController.dart';
import 'package:lister/components/dialogs/correctionDialog.dart';
import 'package:lister/variables.dart';

Future<dynamic> editDeadLineNoteDialog(BuildContext context, iSetState, id) {
  return showDialog(
      context: context,
      builder: (context) {
        return MyDateTimePicker(id: id, iSetState: iSetState);
      });
}

class MyDateTimePicker extends StatefulWidget {
  const MyDateTimePicker({Key? key, this.id, this.iSetState}) : super(key: key);
  final id;
  final iSetState;
  @override
  _MyDateTimePickerState createState() => _MyDateTimePickerState();
}

class _MyDateTimePickerState extends State<MyDateTimePicker> {
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

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.fromDateTime(DateTime.now());

  @override
  void initState() {
    DateTime? selectedDateTime =
        ListerController.databaseNotes[widget.id].deadline;
    if (selectedDateTime != null) {
      selectedDate = selectedDateTime;
      selectedTime = TimeOfDay.fromDateTime(selectedDateTime);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDay = 5 <= selectedTime.hour && selectedTime.hour <= 23;
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(9),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Время завершения',
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize1,
                )),
            SizedBox(height: 10),
            AnimatedContainer(
              duration: Duration(seconds: 1),
              padding: const EdgeInsets.symmetric(horizontal: 32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: getAnimatedColor(selectedTime.hour),
              ),
              child: SunMoon(
                isSun: isDay,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: MyOutlinedButton(
                      title: selectedTime.format(context),
                      onPressed: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                        );
                        if (pickedTime != null)
                          setState(() => selectedTime = pickedTime);
                      }),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: MyOutlinedButton(
                      title: DateFormat('dd.MM.yy').format(selectedDate),
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            initialDatePickerMode: DatePickerMode.day,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year + 1000));
                        if (pickedDate != null)
                          setState(() => selectedDate = pickedDate);
                      }),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: MyOutlinedButtonIcon(
                    icon: Icons.arrow_back_outlined,
                    onPressed: () => Navigator.of(context).pop(false),
                    onLongPress: () => correctionDialog(
                        context: context,
                        setState: setState,
                        title: 'Удалить время завершения?',
                        submitFunction: () {
                          ListerController.databaseNotes[widget.id].deadline =
                              null;
                          widget.iSetState(() {});
                          Navigator.of(context)..pop(false)..pop(false);
                        }),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: MyOutlinedButton(
                    title: 'Сохранить',
                    onPressed: () => setState(
                      () {
                        DateTime deadline = DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          selectedTime.hour,
                          selectedTime.minute,
                        );
                        ListerController.databaseNotes[widget.id].deadline =
                            deadline;
                        widget.iSetState(() {});
                        Navigator.of(context).pop(false);
                      },
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

/// [Widget] for rendering the Sun and Moon Asset
class SunMoon extends StatelessWidget {
  final bool isSun;
  SunMoon({required this.isSun});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: AnimatedSwitcher(
        switchInCurve: Curves.linear,
        switchOutCurve: Curves.linear,
        duration: const Duration(milliseconds: 1),
        child: isSun
            ? Container(
                key: const ValueKey(1),
                child: Image(image: AssetImage('assets/sun.png')))
            : Container(
                key: const ValueKey(2),
                child: Image(image: AssetImage('assets/moon.png'))),
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
    );
  }
}
