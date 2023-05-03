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

           //Material ICONS
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: const [
               Text('Material Icons: ',
               style: TextStyle(
                 color: Colors.purple,
                 fontSize: 30,
                 fontWeight: FontWeight.bold,
               ),
               ),
               Padding(padding: EdgeInsets.all(5)),
               Icon(
                 Icons.home,
                 color: Colors.deepPurpleAccent,
               size: 30,)
             ],
           ),

           Padding(padding: EdgeInsets.all(5)),

           //Cupertino ICONS
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: const [
               Text('Cupertino Icons: ',
                 style: TextStyle(
                   color: Colors.blue,
                   fontSize: 30,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               Padding(padding: EdgeInsets.all(5)),
               Icon(
                 CupertinoIcons.home,
                 color: Colors.blueAccent,
                 size: 30,)
             ],
           ),

           Padding(padding: EdgeInsets.all(5)),
           //FontAwesome ICONS
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: const [
               Text('FontAwesome Icons: ',
                 style: TextStyle(
                   color: Colors.blueGrey,
                   fontSize: 30,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               Padding(padding: EdgeInsets.all(5)),
               Icon(
                 FontAwesomeIcons.house,
                 color: Colors.blueGrey,
                 size: 30,
                 )
             ],
           ),
         ],
       ),
     ),
   );

  }
}