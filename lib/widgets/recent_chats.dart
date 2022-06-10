import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class RecentChats extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  RecentChats({required this.messages, required this.user});
  final List<Message> messages;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.white,
          ),
      child: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (BuildContext, index) {
            final Message chat = messages[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(
                        roomId: chat.roomId,
                        user: user,
                        chatHeader: (chat.sender.id == user.id
                            ? chat.creator.name
                            : chat.sender.name)),
                  )),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage(
                          chat.sender.imageUrl ?? "assets/images/Jenny.jpg"),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chat.sender.id == user.id
                              ? chat.creator.name
                              : chat.sender.name,
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
                    Column(
                      children: [
                        Text(chat.time),
                        chat.unread
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Text(
                                  "New",
                                  style: TextStyle(
                                    // backgroundColor: Colors.redAccent,
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : Text(""),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
