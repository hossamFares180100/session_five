import 'package:flutter/material.dart';
import 'package:session_five/counter_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeScreen extends StatelessWidget {
  String email="";
  String password="";
  final formKey = GlobalKey<FormState>();
  bool validateEmail(String email) => email.contains("@");
  bool validatePassword(String pass) => pass.length >= 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "SignIn Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (email){
                  if(validateEmail(email!)) {
                    this.email = email;
                    return null;
                  }
                  else
                    return "Enter Valid Email";
                },
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (pass){
                  if(validatePassword(pass!)) {
                    password = pass;
                    return null;
                  }
                  else
                    return "enter valid password";
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(onPressed: () async{
                if(formKey.currentState!.validate())
                {
                  SharedPreferences prefs;// Initialize shared preferences
                  prefs = await SharedPreferences.getInstance();
                  prefs.setString("email",email);
                  prefs.setString("password",password);
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                      return CounterScreen();
                    }));
                }
              }, child: Text("don't have an account?")),
              OutlinedButton(onPressed: ()async{
                if(formKey.currentState!.validate())
                  {
                    SharedPreferences prefs;// Initialize shared preferences
                    prefs = await SharedPreferences.getInstance();
                    String e = prefs.getString("email")??"a";
                    String p = prefs.getString("password")??"a";
                    if(e==email && password==p)
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                      return CounterScreen();
                    }));
                    else
                      print("Error");
                  }
              }, child: Text("LogIn")),
            ],
          ),
        ),
      ),
    );
  }
}
