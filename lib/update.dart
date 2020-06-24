import 'package:flutter/material.dart';

import 'database_helper.dart';
class UpdatePage extends StatefulWidget {
  UpdatePage({Key key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final idCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final numberCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Update")
      ),
      body: Container(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[

             Container(
               child:Column(
                 children: <Widget>[
                   Text("Enter Your id"),
                    TextField(
                      controller: idCtrl,
                    )
                 ],
               )
             ),
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
                       updateData();
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
   void updateData()async{
    int i = await DatabaseHelper.instance.update({
      DatabaseHelper.column1  : int.parse(idCtrl.text),
      DatabaseHelper.column2  : nameCtrl.text,
      DatabaseHelper.column3  : numberCtrl.text,
      DatabaseHelper.column4  : emailCtrl.text
     });
     print("updated rows is $i");
  }
}