import 'package:data_ui/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../model/user_model.dart';
import 'home_account.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id="home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void doLogin(){
    String username=usernameController.text.toString().trim();
    String password=passwordController.text.toString().trim();

    var user = new User(username: username, password: password);

    HiveDB().storeUser(user);

    var user2 = HiveDB().loadUser();
    print(user2.username);
    print(user2.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.teal[700]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 50, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage("assets/images/images1.jpg"),
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("Welcome", style: TextStyle(color: Colors.teal[300], fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text("Password", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      margin: EdgeInsets.only(left: 80),
                      child: Text("Forget Password?", style: TextStyle(color: Colors.grey, fontSize: 20),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      width: 370,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.teal[700],
                      ),
                      child: TextButton(
                        onPressed: (){
                          doLogin();
                        },
                        child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 20),),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(left: 170),
                      child: Text("OR", style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(left: 80),
                      child: Row(
                        children: [
                          Icon(Icons.facebook, color: Colors.blue[900],),
                          SizedBox(width: 70,),
                          Icon(Icons.adb_rounded, color: Colors.blue,),
                          SizedBox(width: 70,),
                          Icon(Icons.photo_camera_outlined, color: Colors.black,)
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Don't have an account?", style: TextStyle(color: Colors.grey, fontSize: 20),),
                        SizedBox(width: 5,),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, HomeAccount.id);
                          },
                          child: Text("SignUp", style: TextStyle(color: Colors.teal[600], fontSize: 20, fontWeight: FontWeight.bold),),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
