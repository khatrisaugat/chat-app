import 'dart:convert';

import 'package:chat_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  late final String token;
  Future<User> loginUser(String email, String password) async {
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
      var decodedJson = jsonDecode(response.body);
      if (decodedJson.containsKey('error')) {
        throw decodedJson['error'];
      } else {
        var user = decodedJson['user'];
        token = decodedJson['token'];
        // print(user);
        // print("name==${user['name']}");
        User me =
            User(id: user['id'], name: user['name'], email: user['email']);
        print(me.id);
        // print(token);
        return me;
      }
    } else {
      throw Error();
    }
  }
}
