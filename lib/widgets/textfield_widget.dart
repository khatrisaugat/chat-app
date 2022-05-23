import 'dart:ffi';

import 'package:flutter/material.dart';

class TextfieldWidget extends StatefulWidget {
  @override
  _TextfieldWidget createState() => _TextfieldWidget();
  // const TextfieldWidget({Key? key}) : super(key: key);
  // ignore: use_key_in_widget_constructors
  final String hintText;
  final bool obscureText;

  final Function(String) onChange;
  // ignore: use_key_in_widget_constructors
  const TextfieldWidget(this.hintText, this.obscureText, this.onChange);
}

class _TextfieldWidget extends State<TextfieldWidget> {
  final myController = TextEditingController();
  _retriveText() {
    return myController.text;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white.withOpacity(0.8),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[600]!,
              offset: const Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1),
          const BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 0),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: TextFormField(
          controller: myController,
          obscureText: widget.obscureText,
          autofocus: false,
          style: TextStyle(fontSize: 15.0, color: Colors.black),
          onChanged: widget.onChange,
          decoration: InputDecoration(
            // labelText: 'Your email',
            border: InputBorder.none,
            // floatingLabelStyle: TextStyle(
            //   color: Colors.black,
            //   fontSize: 15.0,
            // ),
            hintText: widget.hintText,
          ),
        ),
      ),
    );
  }
}
