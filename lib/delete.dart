import 'package:flutter/material.dart';

import 'database_helper.dart';
class DeletePage extends StatefulWidget {
  DeletePage({Key key}) : super(key: key);

  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  final idCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Delete")
      ),
      body: Container(
         child: Container(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[

             Container(
               child:Column(
                 children: <Widget>[
                   Text("Enter Your Id"),
                    TextField(
                      controller: idCtrl,
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
                       deleteData();
                    },
                    child: Text("submit"),
                  )
                ],
              )
            ),
          ],
        ),
      ),
      ),
    );
  }
  void deleteData()async{
    int i = await DatabaseHelper.instance.delete(int.parse(idCtrl.text));
     print("deleted id is $i");
  }
}