class User{
  late String username;
  late String password;

  User({required this.username,required this.password,});

  User.fromJson(Map<String, dynamic> json)
      : username = json["username"],
        password = json["password"];

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
  };
}

//Account
class Account{
  late String username;
  late String number;
  late String password;

  Account({required this.username,required this.number, required this.password});

  Account.fromJson(Map<String, dynamic> json)
      : username = json["username"],
        number = json["number"],
        password = json["password"];

  Map<String, dynamic> toJson() => {
    'username': username,
    'number': number,
    'password': password,
  };
}