import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  String text;
  Function onButtonClick;
  int index;
  BoardButton({required this.text,required this.index,required this.onButtonClick});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(4),
            child: ElevatedButton(
                onPressed: () {
                  onButtonClick(index);
                },
                child: Text(
                  text,
                  style: TextStyle(fontSize: 32),
                ))));
  }
}
