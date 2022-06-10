import 'dart:convert';

import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  //login user
  Future<dynamic> loginUser(String email, String password) async {
    var client = http.Client();
    late String token;
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
        return decodedJson;
      } else {
        var user = decodedJson['user'];
        token = decodedJson['token'];
        // print(token);
        // print(user);
        // print("name==${user['name']}");
        User me =
            User(id: user['id'], name: user['name'], email: user['email']);
        me.setToken(token);
        // print(me.id);
        // print(token);
        return me;
      }
    } else {
      //handle error of incorrect credentials
      throw "Incorrect credentials";
    }
  }

  //load homeScreen messages
  Future<List<dynamic>> getMessages(String token) async {
    var client = http.Client();
    var uri = Uri.parse(
        "http://10.0.2.2/chat-api/public/api/messages/getHomeScreenMesssages");
    print("Bearer $token");
    var response = await client.get(
      uri,
      headers: {
        'Content-type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      // print(decodedJson);
      late List<Message> messages = [];
      for (var message in decodedJson) {
        User receiver = await getUser(message['receiver_id'], token);
        // print(receiver);
        // print("message");
        User sender = await getUser(message['sender_id'], token);
        // print(sender);
        // print("message");
        messages.add(Message(
          id: message['id'],
          text: message['text'],
          sender: sender,
          unread: message['unread'] == 0 ? false : true,
          isLiked: message['isLiked'] == 0 ? false : true,
          time: message['updated_at'] == null ? "" : message['updated_at'],
          roomId: message['room_id'],
          roomName: message['room_name'],
          creator: receiver,
        ));
      }
      return messages;
    } else {
      throw "Error loading messages";
    }
  }

  //get Single User
  Future<dynamic> getUser(int userId, String token) async {
    var client = http.Client();
    var uri = Uri.parse("http://10.0.2.2/chat-api/public/api/users/$userId");
    var response = await client.get(uri, headers: {
      'Content-type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      "Authorization": "Bearer $token",
    });
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      // print(decodedJson[0]['id']);
      // print("ok");
      User user = User(
        id: decodedJson[0]['id'],
        name: decodedJson[0]['name'],
        email: decodedJson[0]['email'],
        imageUrl: decodedJson[0]['image_url'],
      );
      // print(user);
      return user;
    } else {
      return {'error': 'User not found'};
    }
  }

  //getMessages from a room
  Future<List<dynamic>> getMessagesFromRoom(String token, int roomId) async {
    var client = http.Client();
    var uri = Uri.parse("http://10.0.2.2/chat-api/public/api/rooms/$roomId");
    var response = await client.get(
      uri,
      headers: {
        'Content-type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      // print(decodedJson);
      late List<Message> messages = [];
      for (var message in decodedJson) {
        User receiver = await getUser(message['receiver_id'], token);
        // print(receiver);
        // print("message");
        User sender = await getUser(message['sender_id'], token);
        // print(sender);
        // print("message");
        messages.add(Message(
          id: message['id'],
          text: message['text'],
          sender: sender,
          unread: message['unread'] == 0 ? false : true,
          isLiked: message['isLiked'] == 0 ? false : true,
          time: message['updated_at'] == null ? "" : message['updated_at'],
          roomId: message['room_id'],
          roomName: message['name'],
          creator: receiver,
        ));
      }
      return messages;
    } else {
      throw "Error loading messages";
    }
  }
}
