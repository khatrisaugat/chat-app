class User {
  final int id;
  final String name;
  final String email;
  String? imageUrl;
  User({
    required this.id,
    required this.name,
    required this.email,
    this.imageUrl,
  });
  String token = "";
  //set token
  void setToken(String token) {
    this.token = token;
  }
}
