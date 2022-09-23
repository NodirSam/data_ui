import 'package:data_ui/pages/home_page.dart';
import 'package:data_ui/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../model/user_model.dart';

class HomeAccount extends StatefulWidget {
  const HomeAccount({Key? key}) : super(key: key);
  static const String id="home_account";

  @override
  State<HomeAccount> createState() => _HomeAccountState();
}

class _HomeAccountState extends State<HomeAccount> {

  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();

  void doLoginAccount(){
    String username=emailController.text.toString().trim();
    String number=numberController.text.toString().trim();
    String password=addressController.text.toString().trim();

    var account = new Account(username: username, number: number, password: password);

    HiveDB1().storeAccount(account);

    var account2 = HiveDB1().loadAccount();
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
                  Text("Welcome", style: TextStyle(color: Colors.teal[300], fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            SizedBox(height: 20,),
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
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Number", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    TextField(
                      controller: numberController,
                      decoration: InputDecoration(
                        hintText: "Number",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Address", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    TextField(
                      controller: addressController,
                      decoration: InputDecoration(
                        hintText: "Address",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      height: 50,
                      width: 370,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.teal[700],
                      ),
                      child: TextButton(
                        onPressed: (){
                          doLoginAccount();
                        },
                        child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 20),),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      margin: EdgeInsets.only(left: 170),
                      child: Text("OR", style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 30,),
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
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Don't have an account?", style: TextStyle(color: Colors.grey, fontSize: 20),),
                        SizedBox(width: 5,),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, HomePage.id);
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