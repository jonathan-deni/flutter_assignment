import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  ProgressWidget(this.progress);
  final int progress;

  @override
  Widget build(BuildContext context) {
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
            backgroundColor: progress != null && progress >= 1 ? Colors.red : Colors.white,
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
            backgroundColor: progress != null && progress >= 2 ? Colors.red : Colors.white,
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
            backgroundColor: progress != null && progress >= 3 ? Colors.red : Colors.white,
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
            backgroundColor: progress != null && progress >= 4 ? Colors.red : Colors.white,
          ),
        ),
      ],
    );
  }
}
