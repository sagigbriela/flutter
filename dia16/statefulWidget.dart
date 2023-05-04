
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp ({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Statefull App',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  String title = 'Color App';
  Color color = Colors.purple;

  State createState(){
    return _MyHomePage();
  }
}

class _MyHomePage extends State<MyHomePage> {
  int _red = 0;
  int _blue= 0;
  int _green = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("El color actual es: "),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.7,
              alignment: Alignment.center,
              color: widget.color,
              child: Text("R (${widget.color.red}), "
                  "G (${widget.color.green}), "
                  "B (${widget.color.blue})"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _cambiarColor,
        backgroundColor: widget.color,
      ),
    );
  }

  void _cambiarColor(){
    _red  = Random.secure().nextInt(256);
    _blue  = Random.secure().nextInt(256);
    _green  = Random.secure().nextInt(256);

    setState(() {
      widget.color = Color.fromRGBO(_red, _green, _blue, 1);
    });
  }
}