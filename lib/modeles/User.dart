
class User {
  late String email;
  User({required this.email});

  User.fromJson(Map<String, dynamic> json){
    email = json['nom'];
  }
}
