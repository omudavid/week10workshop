import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'chat_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final focusNode = FocusNode();
  bool hideButtons = false;

  @override
  void initState() {
    focusNode.addListener(() {
      print('THis is focus ${focusNode.hasFocus}');
      setState(() {
        hideButtons = focusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: const [
            CircleAvatar(),
            SizedBox(
              width: 10,
            ),
            Text(
              'Abike rate urself',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/phone.svg',
                height: 25,
              )),
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset('assets/video.svg')),
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset('assets/info.svg'))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ChatBubble(
              isReply: true,
            ),
            ChatBubble(
              isReply: false,
            ),
            ChatBubble(
              isReply: false,
            ),
            ChatBubble(
              isReply: true,
            ),
            ChatBubble(
              isReply: true,
            ),
            ChatBubble(
              isReply: false,
            ),
            ChatBubble(
              isReply: true,
            ),
            ChatBubble(
              isReply: false,
            ),
            ChatBubble(
              isReply: false,
            ),
            ChatBubble(
              isReply: true,
            ),
            ChatBubble(
              isReply: true,
            ),
            ChatBubble(
              isReply: false,
            ),
          ],
        ),
      ),
      bottomSheet: SizedBox(
        height: 100,
        //    color: Colors.red,
        child: SafeArea(
          child: Row(
            children: [
              Builder(builder: (context) {
                if (hideButtons) {
                  return SizedBox(
                    width: 10,
                  );
                }
                return Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/add.svg',
                          height: 25,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/camera.svg',
                          height: 25,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/photo.svg',
                          height: 25,
                        )),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/mic.svg',
                        height: 25,
                      ),
                    ),
                  ],
                );
              }),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFE4E6EB),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: SvgPicture.asset(
                          'assets/smily.svg',
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0, style: BorderStyle.none),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
