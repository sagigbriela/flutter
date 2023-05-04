
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
  String botonPulsado = 'Ninguno';

//Para cargar imagenes tenemos que ir a pubspec.yaml y en Assets quitar el comentario y aNadir
  //imagenes que queremos agregar a nuestro proyecto
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(widget.title!),
     ),

     body: Center(
       widthFactor: 1,
       heightFactor:10,
       child: Container(
         color: Colors.deepPurple,
         child: const Text(
           'Texto en Container',
           style: TextStyle(
             color: Colors.white,
             fontSize: 30,
             fontWeight: FontWeight.bold,
           ),
         ),
       ),
     ),
   );

  }
}