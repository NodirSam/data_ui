import 'package:hive/hive.dart';

import '../model/user_model.dart';

class HiveDB{
  var box = Hive.box("pdp_online");
  void storeUser(User user) async{
    box.put("user", user.toJson());
  }

  User loadUser(){
    var user = new User.fromJson(box.get("user"));
    return user;
  }

  void removeUser(){
    box.delete("user");
  }
}

//Account
class HiveDB1{
  var box = Hive.box("pdp_account");
  void storeAccount(Account account) async{
    box.put("account", account.toJson());
  }

  Account loadAccount(){
    var account = new Account.fromJson(box.get("user"));
    return account;
  }

  void removeAccount(){
    box.delete("account");
  }
}