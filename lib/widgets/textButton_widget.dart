import 'package:flutter/material.dart';

class TextButtonWidget extends StatefulWidget {
  @override
  _TextButtonWidget createState() => _TextButtonWidget();
  final void Function()? onBtnPressed;
  const TextButtonWidget(this.onBtnPressed);
}

class _TextButtonWidget extends State<TextButtonWidget> {
  // const TextButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
      child: TextButton(
        child: Text('Login'),
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.black,
          onSurface: Colors.grey,
        ),
        onPressed: widget.onBtnPressed,
      ),
    );
  }
}
