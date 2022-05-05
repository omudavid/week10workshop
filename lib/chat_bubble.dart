import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key, required this.isReply}) : super(key: key);

  final bool isReply;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isReply ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
            color: isReply ? Color(0xFFE4E6EB) : Colors.blue,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
                bottomRight: isReply ? Radius.circular(10) : Radius.circular(0),
                bottomLeft:
                    isReply ? Radius.circular(0) : Radius.circular(10))),
        margin: EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: isReply ? 10 : 100,
            right: isReply ? 100 : 10),
        padding: EdgeInsets.all(10),
        child: Text(
            'Hi Abike Please rate yourselfjnjjdfjfdjdjdjdjdjnhhdhdhhfshfhfhkfhfhkshfhdhdshdhdhdhhdhdh'),
      ),
    );
  }
}
