import 'package:demo/database_helper.dart';
import 'package:flutter/material.dart';
class InsertPage extends StatefulWidget {
  InsertPage({Key key}) : super(key: key);

  @override
  _InsertPageState createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  final nameCtrl = TextEditingController();
  final numberCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("insert")
      ),
          body: Container(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[

             Container(
               child:Column(
                 children: <Widget>[
                   Text("Enter Your name"),
                    TextField(
                      controller: nameCtrl,
                    )
                 ],
               )
             ),
             SizedBox(height: 30,),
             Container(
               child:Column(
                 children: <Widget>[
                   Text("Enter Your number"),
                    TextField(
                      controller: numberCtrl,
                    )
                 ],
               )
             ),
             SizedBox(height: 30,),
             Container(
               child:Column(
                 children: <Widget>[
                   Text("Enter Your Email"),
                    TextField(
                      controller: emailCtrl,
                    )
                 ],
               )
             ),
             SizedBox(height: 30,),
            Container(
              child:Column(
                 children: <Widget>[
                   RaisedButton(
                     onPressed: (){
                       insertData();
                    },
                    child: Text("submit"),
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
  void insertData()async{
    int i = await DatabaseHelper.instance.insert({
      DatabaseHelper.column2  : nameCtrl.text,
      DatabaseHelper.column3  : numberCtrl.text,
      DatabaseHelper.column4  : emailCtrl.text
     });
     print("inserted id is $i");
  }
}