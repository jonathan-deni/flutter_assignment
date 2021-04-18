import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_assignment/models/account.dart';
import 'package:flutter_assignment/widgets/next_button.dart';
import 'package:flutter_assignment/widgets/progress_widget.dart';

class VideoCall extends StatefulWidget {
  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  final formKey = GlobalKey<FormState>();
  final account = Account();

  DateTime currentDate;
  DateTime currentTime;
  TextEditingController dateTextController = TextEditingController();
  TextEditingController timeTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /// This builds material date picker in Android
    buildMaterialDatePicker(BuildContext context) async {
      final DateTime picked = await showDatePicker(
        context: context,
        initialDate: currentDate != null ? currentDate : DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2022),
        builder: (context, child) {
          return Theme(
            data: ThemeData.light(),
            child: child,
          );
        },
      );
      if (picked != null && picked != currentDate)
        setState(() {
          currentDate = picked;
          dateTextController.text = DateFormat('EEEE, dd MMMM y').format(picked);
        });
    }

    /// This builds cupertion date picker in iOS
    buildCupertinoDatePicker(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext builder) {
            return Container(
              height: MediaQuery.of(context).copyWith().size.height / 3,
              color: Colors.white,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (picked) {
                  if (picked != null && picked != currentDate)
                    setState(() {
                      currentDate = picked;
                      dateTextController.text = DateFormat('EEEE, dd MMMM y').format(picked);
                    });
                },
                initialDateTime: currentDate != null ? currentDate : DateTime.now(),
                minimumYear: int.parse(DateFormat('y').format(DateTime.now())),
                maximumYear: 2022,
              ),
            );
          });
    }

    buildMaterialTimePicker(BuildContext context) {
      DateTime selectedDate = currentDate != null ? currentDate : new DateTime.now();
      showTimePicker(
          context: context,
          initialTime: TimeOfDay.now()
      ).then((value) => setState(() => {
        currentTime = new DateTime(selectedDate.year, selectedDate.month, selectedDate.day, value.hour, value.minute),
        timeTextController.text = DateFormat('jm').format(currentTime)
      }));
    }

    buildCupertinoTimePicker(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext builder) {
            return Container(
              height: MediaQuery.of(context).copyWith().size.height / 3,
              color: Colors.white,
              child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  onDateTimeChanged: (picked) {
                    if (picked != null && picked != currentDate)
                      print(picked);
                      setState(() {
                        currentTime = picked;
                        timeTextController.text = DateFormat('jm').format(picked);
                      });
                    },
                  ),
            );
          });
    }

    _selectDate(BuildContext context) async {
      final ThemeData theme = Theme.of(context);
      assert(theme.platform != null);
      switch (theme.platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          return buildMaterialDatePicker(context);
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          return buildCupertinoDatePicker(context);
      }
    }

    _selectTime(BuildContext context) async {
      final ThemeData theme = Theme.of(context);
      assert(theme.platform != null);
      switch (theme.platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          return buildMaterialTimePicker(context);
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          return buildCupertinoTimePicker(context);
      }
    }

    return Scaffold(
        backgroundColor: Colors.blueAccent[400],
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[400],
          title: Text('Create Account'),
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ProgressWidget(),
                Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Colors.white,
                          width: 10,
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.blueAccent[400],
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        'Schedule Video Call',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.white),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Choose the date and time that you preferred, we will send a link via email to make a video call on the scheduled date and time',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.white,
                                width: 10,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Date'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 9,
                                      child: TextFormField(
                                        enabled: false,
                                        textInputAction: TextInputAction.done,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '-Chose Date-'),
                                        controller: dateTextController,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.blueAccent[400],
                                        ),
                                        onPressed: () {
                                          _selectDate(context);
                                        },
                                      )
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.white,
                                width: 10,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Time'),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 9,
                                      child: TextFormField(
                                        enabled: false,
                                        textInputAction: TextInputAction.done,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '-Chose Time-'),
                                        controller: timeTextController,
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.keyboard_arrow_down,
                                            color: Colors.blueAccent[400],
                                          ),
                                          onPressed: () {
                                            _selectTime(context);
                                          },
                                        )
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
                Column(
                  children: <Widget>[
                    NextButton(onPressNextButton: () {

                      // Navigator.pushNamed(context, '/vcall');
                    }),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
