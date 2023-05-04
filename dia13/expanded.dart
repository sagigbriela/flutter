
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget { //No guarda informacion de estado
  @override
  Widget build(BuildContext context) { //Para construir lo que queramos
    return MaterialApp(
      title: 'GabrielaApp',
      debugShowCheckedModeBanner: false, //quita el cartel de debug de la esquina
      home: MyHomePage(title: 'Sheikah'),
    );
  }
}

class MyHomePage extends StatefulWidget { //Guarda informacion de estado
  MyHomePage({Key? key, this.title}):super(key:key); //constructor subclase

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> { //Estado (modificar en pantalla)


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(widget.title!),
     ),
     body: Center(
       child: Row(
         children: [
           Container(
             padding: EdgeInsets.all(10),
             color: Colors.amber,
             child: Text('A'),
           ),
           Expanded(
             child: Container(
               padding: EdgeInsets.all(10),
               color: Colors.red,
               child: Text('B'),
             ),
           ),
           Expanded(
             child: Container(
               padding: EdgeInsets.all(10),
               color: Colors.blue,
               child: Text('C'),
             ),
           ),
         ],
       )
     ),
   );

  }
}