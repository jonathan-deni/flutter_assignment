import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/account.dart';

class ProgressWidget extends StatefulWidget {
  const ProgressWidget({
    Key key,
  }) : super(key: key);

  @override
  _ProgressWidgetState createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  final account = Account();

  @override
  Widget build(BuildContext context) {
    // int progress = account.progress;
    // print(account.progress);

    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: CircleAvatar(
            child:Text(
              '1',
              style: TextStyle(
                  color: Colors.black
              ),
            ),
            // backgroundColor: progress != null && progress >= 1 ? Colors.red : Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: CircleAvatar(
            child:Text(
              '2',
              style: TextStyle(
                  color: Colors.black
              ),
            ),
            // backgroundColor: progress != null && progress >= 2 ? Colors.red : Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: CircleAvatar(
            child:Text(
              '3',
              style: TextStyle(
                  color: Colors.black
              ),
            ),
            // backgroundColor: progress != null && progress >= 3 ? Colors.red : Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: CircleAvatar(
            child:Text(
              '4',
              style: TextStyle(
                  color: Colors.black
              ),
            ),
            // backgroundColor: progress != null && progress >= 4 ? Colors.red : Colors.white,
          ),
        ),
      ],
    );
  }
}
