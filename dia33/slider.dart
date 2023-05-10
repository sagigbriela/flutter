import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Switch',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Switch'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double _opcionSlider = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
        children: [
           Text("Slider",
           style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          Slider(value: _opcionSlider,
              onChanged: (value){
            setState(() {
              _opcionSlider = value;
            });
              }),
          Padding(padding: EdgeInsets.all(10)),
          Divider(),
          Text("Cupertino Slider",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
          Padding(padding: EdgeInsets.all(10)),
          CupertinoSlider(value: _opcionSlider,
              onChanged: (value){
            setState(() {
              _opcionSlider = value;
            });
              })
            ],
          )
    ),
    );
  }


}

enum RadioOpciones{
  Coche,
  Avion,
  Barco,
}




