import 'package:chat_app/widgets/textButton_widget.dart';
import 'package:chat_app/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[600]!,
              offset: const Offset(4, 0),
              blurRadius: 5,
              spreadRadius: 1),
          const BoxShadow(
              color: Colors.grey,
              offset: Offset(-4, 0),
              blurRadius: 5,
              spreadRadius: 0),
        ],
        // gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [Colors.white, Theme.of(context).colorScheme.secondary]),
      ),
      child: Column(
        children: [
          Text(
            "Login",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextfieldWidget("Your email", false),
          TextfieldWidget("Your Password", true),
          TextButtonWidget(),
        ],
      ),
    );
  }
}
