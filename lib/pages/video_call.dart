import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_assignment/models/account.dart';
import 'package:flutter_assignment/widgets/next_button.dart';

class VideoCall extends StatefulWidget {
  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  final formKey = GlobalKey<FormState>();
  final account = Account();

  DateTime currentDate;
  TimeOfDay currentTime;
  TextEditingController dateTextController = TextEditingController();
  TextEditingController timeTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                Row(
                  children: <Widget>[Text('STEP 5 OF 5')],
                ),
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
                                          showDatePicker(
                                              context: context, 
                                              initialDate: currentDate != null ? currentDate : DateTime.now(), 
                                              firstDate: DateTime.now(), 
                                              lastDate: DateTime(2022)
                                          ).then((value) => setState(() => {
                                            currentDate = value,
                                            dateTextController.text = DateFormat('EEEE, dd MMMM y').format(value)
                                          }));
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
                                            showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now()
                                            ).then((value) => setState(() => {
                                              currentTime = value,
                                              timeTextController.text = value.format(context)
                                            }));
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
                      // Builder(
                      //   builder: (context) => Form(
                      //     key: formKey,
                      //     child:
                      //     Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       mainAxisSize: MainAxisSize.max,
                      //       children: <Widget>[
                      //         Container(
                      //           decoration: BoxDecoration(
                      //             color: Colors.white,
                      //             borderRadius: BorderRadius.circular(10),
                      //             border: Border.all(
                      //               color: Colors.white,
                      //               width: 10,
                      //             ),
                      //           ),
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: <Widget>[
                      //               // Text('Date'),
                      //               Text('${currentDate.toString()}'),
                      //               DropdownButtonFormField(
                      //                 value: currentDate,
                      //                 decoration: InputDecoration(
                      //                     enabledBorder: UnderlineInputBorder(
                      //                         borderSide: BorderSide(color: Colors.white)
                      //                     )
                      //                 ),
                      //
                      //                 // items: goalsList.map((goals) {
                      //                 //   return DropdownMenuItem(
                      //                 //     value: goals,
                      //                 //     child: Text('$goals'),
                      //                 //   );
                      //                 // }).toList(),
                      //                 hint: Text('-Choose Option-'),
                      //                 disabledHint: Text('-Choose Option-'),
                      //                 onChanged: (val) => setState(() => currentDate = val),
                      //                 onSaved: (val) => setState(() => account.vCallDate = val),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //         SizedBox(height: 20.0,),
                      //         Container(
                      //           decoration: BoxDecoration(
                      //             color: Colors.white,
                      //             borderRadius: BorderRadius.circular(10),
                      //             border: Border.all(
                      //               color: Colors.white,
                      //               width: 10,
                      //             ),
                      //           ),
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: <Widget>[
                      //               Text('${currentTime.toString()}'),
                      //               // Text('Time'),
                      //               DropdownButtonFormField(
                      //                 value: currentTime.toString(),
                      //                 decoration: InputDecoration(
                      //                     enabledBorder: UnderlineInputBorder(
                      //                         borderSide: BorderSide(color: Colors.white)
                      //                     )
                      //                 ),
                      //                 // items: incomeList.map((goals) {
                      //                 //   return DropdownMenuItem(
                      //                 //     value: goals,
                      //                 //     child: Text('$goals'),
                      //                 //   );
                      //                 // }).toList(),
                      //                 hint: Text('-Choose Option-'),
                      //                 disabledHint: Text('-Choose Option-'),
                      //                 // onChanged: (val) => setState(() => currentTime = val),
                      //                 onSaved: (val) => setState(() => account.vCallTime = val),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //
                      //       ],
                      //     ),
                      //   ),
                      // ),
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
