

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp ({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'SimpleDialog App',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  String title = 'SimpleDialog App';

  State createState(){
    return _MyHomePage();
  }
}

class _MyHomePage extends State<MyHomePage> {

  String _opcion = 'Ninguna';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _elegirOpcion,
                child: Text("Abrir SimpleDialog"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                textStyle: TextStyle(color: Colors.white)
              ),
            ),
            Padding(padding: EdgeInsets.all(15)),
            Text("La eleccion es: ", style: TextStyle(color: Colors.purple[300], fontSize: 20),),
            Padding(padding: EdgeInsets.all(15)),
            Text('$_opcion', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }

  Future<void> _elegirOpcion() async{
    switch(
    await showDialog(context: context,
        builder: (BuildContext context){
          return SimpleDialog(
            title: Text("Selecciona una opcion de transporte"),
            children: [
              SimpleDialogOption(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.directions_car),
                    Text(" Coche")
                  ],
                ),
                onPressed: (){
                  Navigator.pop(context, ListaOpciones.Coche);
                },
              ),
              SimpleDialogOption(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.airplanemode_active),
                    Text(" Avion")
                  ],
                ),
                onPressed: (){
                  Navigator.pop(context, ListaOpciones.Avion);
                },
              ),
              SimpleDialogOption(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.directions_boat),
                    Text(" Barco")
                  ],
                ),
                onPressed: (){
                  Navigator.pop(context, ListaOpciones.Barco);
                },
              ),
            ],
          );
        })
    ){
      case ListaOpciones.Coche:
      _opcionElegida("Coche");
        break;
      case ListaOpciones.Avion:
        _opcionElegida("Avion");
        break;
      case ListaOpciones.Barco:
        _opcionElegida("Barco");
        break;
    }
  }
  void _opcionElegida (String opcion){
    setState(() {
      _opcion = opcion;
    });

  }
}



enum ListaOpciones {
  Coche,
  Avion,
  Barco,
}
