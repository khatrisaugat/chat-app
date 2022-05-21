import 'package:chat_app/models/user_model.dart';

class Message {
  final int id;
  final String text;
  final User sender;
  final bool unread;
  final bool isLiked;
  final String time;
  final int roomId;
  final String roomName;
  final User creator;
  Message({
    required this.id,
    required this.text,
    required this.sender,
    required this.unread,
    required this.isLiked,
    required this.time,
    required this.roomId,
    required this.roomName,
    required this.creator,
  });
}

//users
final User steven = User(
    id: 0,
    name: "Steven",
    email: "Steven@gmail.com",
    imageUrl: "assets/images/Steven.jpg");

final User anika = User(
    id: 1,
    name: "Anika",
    email: "Anika@gmail.com",
    imageUrl: "assets/images/Anika.jpg");

final User bruce = User(
    id: 2,
    name: "Bruce",
    email: "Bruce@gmail.com",
    imageUrl: "assets/images/Bruce.jpg");

final User jenny = User(
    id: 3,
    name: "Jenny",
    email: "Jenny@gmail.com",
    imageUrl: "assets/images/Jenny.jpg");

final User lacey = User(
    id: 4,
    name: "Lacey",
    email: "Lacey@gmail.com",
    imageUrl: "assets/images/Lacey.jpg");

final User jin = User(
    id: 4,
    name: "Jin",
    email: "Steven@gmail.com",
    imageUrl: "assets/images/Jin.jpg");

final User lolita = User(
    id: 4,
    name: "Lolita",
    email: "Lolita@gmail.com",
    imageUrl: "assets/images/Lolita.jpg");
final User mark = User(
    id: 4,
    name: "Mark",
    email: "Steven@gmail.com",
    imageUrl: "assets/images/Mark.jpg");

final User michael = User(
    id: 4,
    name: "Michael",
    email: "Michael@gmail.com",
    imageUrl: "assets/images/Michael.jpg");

//favorite contacts
List<User> favorites = [anika, bruce, jenny, michael, lolita];

//chats that appear in HomeScreen
List<Message> chats = [
  Message(
    id: 1,
    sender: anika,
    time: "5:30 PM",
    text: "How's it going?",
    isLiked: false,
    unread: true,
    roomId: 1,
    roomName: "anika",
    creator: steven,
  ),
  Message(
    id: 2,
    sender: bruce,
    time: "3:30 PM",
    text: "What's up Bruh??",
    isLiked: false,
    unread: true,
    roomId: 2,
    roomName: "Bruce",
    creator: steven,
  ),
  Message(
    id: 3,
    sender: jin,
    time: "3:00 PM",
    text: "Have you done your project?",
    isLiked: false,
    unread: true,
    roomId: 3,
    roomName: "Jin",
    creator: steven,
  ),
  Message(
    id: 4,
    sender: lacey,
    time: "2:35 PM",
    text: "Can you help me with project?",
    isLiked: false,
    unread: true,
    roomId: 4,
    roomName: "Lacey",
    creator: steven,
  ),
  Message(
    id: 5,
    sender: michael,
    time: "2:30 PM",
    text: "Bro!!",
    isLiked: false,
    unread: true,
    roomId: 5,
    roomName: "Michael",
    creator: steven,
  ),
  Message(
    id: 6,
    sender: lolita,
    time: "1:32 PM",
    text: "Hello",
    isLiked: true,
    unread: false,
    roomId: 6,
    roomName: "Lolita",
    creator: steven,
  ),
];

List<Message> messages = [
  Message(
    id: 8,
    sender: steven,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
    roomId: 1,
    roomName: "anika",
    creator: steven,
  ),
  Message(
    id: 9,
    sender: steven,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
    roomId: 1,
    roomName: "anika",
    creator: steven,
  ),
  Message(
    id: 10,
    sender: anika,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
    roomId: 1,
    roomName: "anika",
    creator: steven,
  ),
  Message(
    id: 11,
    sender: anika,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
    roomId: 1,
    roomName: "anika",
    creator: steven,
  ),
  Message(
    id: 12,
    sender: steven,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
    roomId: 1,
    roomName: "anika",
    creator: steven,
  ),
  Message(
    id: 13,
    sender: anika,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
    roomId: 1,
    roomName: "anika",
    creator: steven,
  ),
];
