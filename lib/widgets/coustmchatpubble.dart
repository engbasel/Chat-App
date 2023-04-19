import 'package:chat_two/Models/MassageModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:chat_two/Constans.dart';

class CoustomChatbuble extends StatelessWidget {
  CoustomChatbuble({required this.MassageText});
  double readusContainer = 30;
  double ContainerHight = 60;
  double ContainerWidth = 200;
  final MassageModel MassageText;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(
          left: 5,
          top: 5,
          bottom: 15,
          right: 5,
        ),
        margin: EdgeInsets.only(
          left: 10,
          top: 10,
          bottom: 10,
          right: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(readusContainer),
            topRight: Radius.circular(readusContainer),
            bottomRight: Radius.circular(readusContainer),
          ),
          color: Color(0xFFFecebec),
        ),
        // height: ContainerHight,
        // width: ContainerWidth,
        child: Padding(
          padding: EdgeInsets.only(top: 15, left: 25, right: 10.0, bottom: 10),
          child: Text(
            MassageText.MassageText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}

// ------------------------Chat buble anther berson ---------------
class CoustomChatFrind extends StatelessWidget {
  CoustomChatFrind({required this.MassageText});
  double readusContainer = 30;
  double ContainerHight = 60;
  double ContainerWidth = 200;
  final MassageModel MassageText;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(
          left: 5,
          top: 5,
          bottom: 15,
          right: 5,
        ),
        margin: EdgeInsets.only(
          left: 10,
          top: 10,
          bottom: 10,
          right: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(readusContainer),
            topRight: Radius.circular(readusContainer),
            bottomLeft: Radius.circular(readusContainer),
          ),
          color: Color(0xFFe0d5ff),
        ),
        // height: ContainerHight,
        // width: ContainerWidth,
        child: Padding(
          padding: EdgeInsets.only(top: 15, left: 25, right: 10.0, bottom: 10),
          child: Text(
            MassageText.MassageText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
