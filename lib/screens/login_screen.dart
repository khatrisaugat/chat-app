import 'package:chat_app/widgets/login_card.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("./assets/images/wallpaper.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.srgbToLinearGamma(),
                  ),
                  // color: Theme.of(context).primaryColor,
                  color: Color.fromARGB(255, 218, 210, 210),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: LoginCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
