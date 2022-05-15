import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
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
                  leading: Ink(
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      iconSize: 28.0,
                      onPressed: () {},
                    ),
                    decoration: ShapeDecoration(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none),
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
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
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            )),
      ),
    );
  }
}
