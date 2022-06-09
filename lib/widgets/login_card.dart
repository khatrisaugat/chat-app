import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:chat_app/services/remote_service.dart';
import 'package:chat_app/widgets/textButton_widget.dart';
import 'package:chat_app/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class LoginCard extends StatefulWidget {
  _LoginCard createState() => _LoginCard();
  String email = "";
  String password = "";
  String error = "";
  LoginCard({Key? key}) : super(key: key);
}

class _LoginCard extends State<LoginCard> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  getData() async {
    // print(widget.email);

    // widget.user = await RemoteService()
    //     .loginUser(emailController.text, passwordController.text);
    dynamic me = await RemoteService()
        .loginUser(emailController.text, passwordController.text);
    if (me is User) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(me)),
      );
    } else {
      setState(() {
        widget.error = me['error'];
      });
    }
    // print(me);
    // try {
    //   User me = await RemoteService()
    //       .loginUser(emailController.text, passwordController.text);
    //   // ignore: use_build_context_synchronously
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => HomeScreen(me)),
    //   );
    // } on Exception catch (_, ex) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 350,
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
          // TextfieldWidget("Your email", false, (value) {
          //   // email = value != "" ? value : email;
          //   if (value != "") {
          //     widget.email = value;
          //     print(widget.email);
          //   }
          // }),
          // TextfieldWidget("Your Password", true, (value) {
          //   // password = value != "" ? value : password;
          //   if (value != "") {
          //     widget.password = value;
          //     print(widget.email);
          //     print(widget.password);
          //   }
          // }),
          TextfieldWidget("Your email", false, emailController),
          TextfieldWidget("Your Password", true, passwordController),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.error,
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButtonWidget(() {
            // print(emailController.text);
            // print(passwordController.text);
            getData();
            // showDialog(
            //     context: context,
            //     builder: (BuildContext context) => AlertDialog(
            //           content: Text(widget.password),
            //         ));
          }),
        ],
      ),
    );
  }
}
