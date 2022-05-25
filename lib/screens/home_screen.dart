import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/widgets/recent_chats.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final User me;
  @override
  _HomeScreenState createState() => _HomeScreenState();
  HomeScreen(this.me);
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                ),
                child: AppBar(
                  centerTitle: true,
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        steven.imageUrl ?? "assets/images/Jenny.jpg"),
                    radius: 25.0,
                  ),
                  title: Text(
                    "Messages",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  elevation: 0.0,
                  backgroundColor: Theme.of(context).primaryColor,
                  actions: [
                    Ink(
                      child: IconButton(
                        icon: Icon(Icons.search),
                        iconSize: 25.0,
                        onPressed: () {},
                      ),
                      decoration: ShapeDecoration(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none),
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            )),
        child: const RecentChats(),
      ),
    );
  }
}
