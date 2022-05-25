import 'dart:convert';

import 'package:chat_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<dynamic> loginUser(String email, String password) async {
    var client = http.Client();
    var body = {
      "email": email,
      "password": password,
    };
    var uri = Uri.parse("http://10.0.2.2/chat-api/public/api/login");
    var response = await client.post(
      uri,
      body: body,
      headers: {
        'Content-type': 'application/x-www-form-urlencoded',
        // 'Accept': 'application/json',
        // "Authorization": "Some token"
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    }
  }
}
