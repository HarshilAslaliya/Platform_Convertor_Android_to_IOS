import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../globals/globals.dart';

class SettingsComponents extends StatefulWidget {
  const SettingsComponents({Key? key}) : super(key: key);

  @override
  State<SettingsComponents> createState() => _SettingsComponentsState();
}

class _SettingsComponentsState extends State<SettingsComponents> {
  DateTime today = DateTime.now();

  // String date = DateTime.now().toString();

  TimeOfDay todayTime = TimeOfDay.now();

  List<String> allMonths = [
    'Jan',
    'Feb',
    'March',
    'April',
    'May',
    'June',
    'July',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Date',
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${today.day}, ${allMonths[today.month - 1]} ${today.year}',
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          (Globals.isIos == false)
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: today,
                          firstDate: DateTime(2010),
                          lastDate: DateTime(2025),
                        );
                        setState(() {
                          if (pickedDate != null) {
                            today = pickedDate;
                          }
                        });
                      },
                      child: Text(
                        'Change Date',
                        style: TextStyle(fontSize: 20),
                      )),
                )
              : Container(
                  height: MediaQuery.of(context).size.height * 0.064,
                  width: double.infinity,
                  padding: EdgeInsets.all(0),
                  child: CupertinoButton.filled(
                      child: Text(
                        'Change Date',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return Container(
                                color: Colors.white,
                                height: 220,
                                child: CupertinoDatePicker(
                                  onDateTimeChanged: (dateTime) {
                                    setState(() {
                                      today = dateTime;
                                    });
                                  },
                                  initialDateTime: today,
                                  maximumYear: 2050,
                                  minimumYear: 2010,
                                  mode: CupertinoDatePickerMode.date,
                                ),
                              );
                            });
                      }),
                ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Time',
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${(todayTime.hour > 12) ? todayTime.hour - 12 : todayTime.hour} : ${todayTime.minute} ${todayTime.period.name}',
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          (Globals.isIos == false)
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                          context: context, initialTime: todayTime);
                      setState(() {
                        if (pickedTime != null) {
                          todayTime = pickedTime;
                        }
                      });
                    },
                    child: Text(
                      'Change Time',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height * 0.064,
                  width: double.infinity,
                  padding: EdgeInsets.all(0),
                  child: CupertinoButton.filled(
                      child: Text(
                        'Change Date',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return Container(
                                color: Colors.white,
                                height: 220,
                                child: CupertinoDatePicker(
                                  onDateTimeChanged: (dateTime) {
                                    int hour = dateTime.hour;
                                    int minutes = dateTime.minute;
                                    String period =
                                        (dateTime.hour > 12) ? 'pm' : 'am';
                                    setState(() {
                                      todayTime = TimeOfDay(
                                          hour: hour, minute: minutes);
                                    });
                                  },
                                  initialDateTime: today,
                                  mode: CupertinoDatePickerMode.time,
                                ),
                              );
                            });
                      }),
                ),
        ],
      ),
    );
  }
}
