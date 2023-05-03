
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
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [

           Padding(padding: EdgeInsets.all(10)),
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset('Assets/Images/TLoZ.webp',
               width: 100,),
               Padding(padding: EdgeInsets.all(10)),
               Image.network('https://media.vandal.net/i/1440x1080/9-2022/202292911251929_1.jpg',
               width: 300,)
                //flutter run -d chrome --no-sound-null-safety --web-renderer=html
             ],
           )
         ],

       ),
     ),
   );

  }
}