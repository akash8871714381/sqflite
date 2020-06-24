import 'package:demo/database_helper.dart';
import 'package:demo/update.dart';
import 'package:flutter/material.dart';

import 'delete.dart';
import 'insert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  void _incrementCounter() {
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           RaisedButton(
             onPressed: (){
             Navigator.push(
            context, MaterialPageRoute(builder: (context) => InsertPage()));
            },
            child: Text(
              "Insert"
            ),
           ),
           RaisedButton(
             onPressed: (){
             Navigator.push(
            context, MaterialPageRoute(builder: (context) => UpdatePage()));
            },
            child: Text(
              "Update"
            ),
           ),
           RaisedButton(
             onPressed: ()async{
             List<Map<String,dynamic>> getData = await DatabaseHelper.instance.queryAll();
             print(getData);
            },
            child: Text(
              "Select"
            ),
           ),
           RaisedButton(
             onPressed: (){
             Navigator.push(
            context, MaterialPageRoute(builder: (context) => DeletePage()));
            },
            child: Text(
              "Delete"
            ),
           )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
