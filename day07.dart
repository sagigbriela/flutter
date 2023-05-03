import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  String botonPulsado = 'Ninguno';

  //Esta parte identificara si el dispositivo es Android o IOS
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
           Text(
             'El boton pulsado es: '
           ),
           Text(
             '$botonPulsado'
           ),
           Padding(padding: EdgeInsets.all(20)),

           //Boton elevado
           ElevatedButton(
               onPressed: _elevetedButton,
               child: Text(
                 'ElevetedButton'),
                 style: ElevatedButton.styleFrom(
                   elevation: 100,
                   backgroundColor: Colors.amber,
                   shadowColor: Colors.amberAccent,
                 ),
               )
         ],
       )
     ),

//Flating Bottom, el que esta en la esquina
     floatingActionButton: FloatingActionButton(
       onPressed: _floatinPulsado,
       tooltip: 'Pulsame',
       child: Icon(Icons.add,
       color: Colors.white,),
       backgroundColor:  Colors.cyanAccent,
     ),
   );
  }

  void _floatinPulsado(){
    _queBoton('flo');
  }

  void _elevetedButton(){
    _queBoton('ele');
  }

  void _queBoton(String boton){
    setState(() {
      switch(boton){
        case 'flo':
          botonPulsado = 'Floating action';
          break;
        case 'ele':
          botonPulsado = 'Elevated Buttom';
          break;
      }
    });

  }

}