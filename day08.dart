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
                   elevation: 10,
                   backgroundColor: Colors.amber,
                   shadowColor: Colors.amberAccent,
                 ),
               ),
           Padding(padding: EdgeInsets.all(5)),

           //Boton de Texto
           TextButton(
               onPressed: _textButton, 
               child: Text('Boton de Texto'),
                style:TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.limeAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
           ),
           Padding(padding: EdgeInsets.all(5)),

           //Boton Icono sin fondo
           IconButton(
               onPressed: _IconPulsado,
               icon: Icon(Icons.accessibility),
                color: Colors.black,
           ),
           Padding(padding: EdgeInsets.all(5)),

           //Boton Icono con fondo
           Ink(
             decoration: ShapeDecoration(
               shape: CircleBorder(),
               color: Colors.yellowAccent
             ),
             child:IconButton(
               onPressed: _IconCamara,
               icon: Icon(Icons.add_a_photo_outlined),
               color: Colors.black,
             ), 
           ),
           Padding(padding: EdgeInsets.all(5)),

           //Boton Estilo Texto
           OutlinedButton(
               onPressed: _outlineBoton,
               child: Text('Outline Button',
               style: TextStyle(
                 color: Colors.orange,
               ),
               ),
             style: OutlinedButton.styleFrom(
               side: BorderSide(
                 width: 1,
                 color: Colors.purple,
                 style: BorderStyle.solid,
               )
             ),
           ),
           Padding(padding: EdgeInsets.all(5)),

           CupertinoButton(
               child: Text('Boton de Cupertino',),
               onPressed: _cupertinoBoton,
             color: Colors.blue,
           ),
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
  
  void _textButton(){
    _queBoton('text');
  }

  void _IconPulsado(){
    _queBoton('Icon');
  }

  void _IconCamara(){
    _queBoton('Cam');
  }

  void _outlineBoton(){
    _queBoton('Outline');
  }

  void _cupertinoBoton(){
    _queBoton('cuper');
  }

  void _queBoton(String boton){
    setState(() {
      switch(boton){
        case 'flo':
          botonPulsado = 'Floating action';
          break;
        case 'ele':
          botonPulsado = 'Elevated Button';
          break;
        case 'text':
          botonPulsado = 'Text Button';
          break;
        case 'Icon':
          botonPulsado = 'Boton de Icono';
          break;
        case 'Cam':
          botonPulsado = 'Boton Icon Camara';
          break;
        case 'Outline':
          botonPulsado = 'Outline Boton';
          break;
        case 'cuper':
          botonPulsado = 'Cupertino Boton';
          break;
      }
    });

  }

}