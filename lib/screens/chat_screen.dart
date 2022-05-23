import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  // ignore: use_key_in_widget_constructors
  const ChatScreen({required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    _buildMessage(Message message, bool isMe) {
      Container messageContainer = Container(
        margin: isMe ? EdgeInsets.only(left: 70.0) : EdgeInsets.only(left: 5.0),
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            isMe
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(message.isLiked
                        ? Icons.favorite
                        : Icons.favorite_border_outlined),
                    color: Colors.blueGrey,
                    alignment: Alignment.centerRight,
                  )
                : CircleAvatar(
                    backgroundImage: AssetImage(
                        widget.user.imageUrl ?? "assets/images/Jenny.jpg"),
                    radius: 20.0,
                  ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width * 0.60,
                  decoration: BoxDecoration(
                    color: isMe
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      message.text,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: isMe ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                Text(
                  message.time,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            isMe
                ? SizedBox(
                    width: 1.0,
                  )
                : IconButton(
                    onPressed: () {},
                    icon: Icon(message.isLiked
                        ? Icons.favorite
                        : Icons.favorite_border_outlined),
                    color: Colors.blueGrey,
                  ),
          ],
        ),
      );
      return messageContainer;
    }

    _buildComposer() {
      return Container(
        padding: EdgeInsets.all(8.0),
        height: 70.0,
        color: Theme.of(context).primaryColor,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.emoji_emotions),
              color: Colors.white,
            ),
            Expanded(
              child: TextFormField(
                textCapitalization: TextCapitalization.sentences,
                style: TextStyle(
                  color: Colors.white,
                ),
                onChanged: (value) {},
                decoration: InputDecoration.collapsed(
                  hintText: "send a message...",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.send),
              color: Colors.white,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          widget.user.name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
                child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, position) {
                      final Message message = messages[position];
                      final bool isMe =
                          messages[position].sender.id == widget.user.id
                              ? false
                              : true;
                      return _buildMessage(message, isMe);
                    }),
              ),
            ),
            _buildComposer(),
          ],
        ),
      ),
    );
  }
}
