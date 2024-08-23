import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:session_five/animal.dart';
class CounterScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CounterScreenState();
  }

}
class CounterScreenState extends State<CounterScreen> {
  int value = 0;
  String s = Animal("h", 24).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueAccent,
        title: Text(
          "counter screen $value",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Animal a = s as Animal;
                  print("value is ${a.age}");
                  setState(() {
                    value--;
                  });
                },
                child: Text(
                  "Minus",
                  style: TextStyle(fontSize: 35),
                )),
            Text("$value", style:TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold
            ),),
            TextButton(
                onPressed: () {
                  setState(() {
                    value++;
                  });
                },
                child: Text(
                  "Plus",
                  style: TextStyle(fontSize: 35),
                )),
          ],
        ),
      ),
    );
  }
}
