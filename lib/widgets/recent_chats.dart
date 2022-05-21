import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.white,
          ),
      child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (BuildContext, index) {
            final Message chat = chats[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(user: chat.sender),
                  )),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage(chat.sender.imageUrl),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chat.roomName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Text(
                            chat.text,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Text(chat.time),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
