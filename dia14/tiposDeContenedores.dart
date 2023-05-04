
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
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Container(
             child: Text("Contenedor 1"),
             color: Colors.amber,
             margin: EdgeInsets.only(bottom: 10),
             padding: EdgeInsets.all(20),
           ),
           Container(
             child: Text("Contenedor 2"),
             color: Colors.red,
             margin: EdgeInsets.only(bottom: 10),
             height: 50,
             width: 50,
           ),
           Container(
             decoration: BoxDecoration(
               shape: BoxShape.circle,
               color: Colors.blue,
               
             ),
             child: Text("Contenedor 3"),
             margin: EdgeInsets.only(bottom: 10),
           ),
           Container(
             decoration: BoxDecoration(
               shape: BoxShape.circle,
               color: Colors.lightGreenAccent,
             ),
             child: Text("Contenedor 3"),
             margin: EdgeInsets.only(bottom: 10),
             padding: EdgeInsets.all(50),
           ),
           Container(
             decoration: BoxDecoration(
               border: Border.all(
                 color: Colors.purpleAccent,
                 width: 2,
                 style: BorderStyle.solid,
               ),
               color: Colors.purple,
               borderRadius: BorderRadius.all(Radius.circular(20)),
             ),
             child: Text("Contenedor 5",
             style: TextStyle(color: Colors.white),),
             margin: EdgeInsets.only(bottom: 10),
             padding: EdgeInsets.all(10),
           )
         ],
       )
     ),
   );

  }
}