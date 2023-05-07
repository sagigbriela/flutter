

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp ({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Option App',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  String title = 'Option App';

  State createState(){
    return _MyHomePage();
  }
}

class _MyHomePage extends State<MyHomePage> {

  String _opcion = 'Ninguna';
  String _botonPulsado = 'Ninguno';
  
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
            ElevatedButton(onPressed: _elegirOpcionBottomSheet,
              child: Text("Abrir BottomSheet"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  textStyle: TextStyle(color: Colors.white)
              ),
            ),
            Padding(padding: EdgeInsets.all(15)),
            ElevatedButton(onPressed: _elegirActionSheetCupertino,
              child: Text("Abrir BottomSheetCupertino"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  textStyle: TextStyle(color: Colors.white)
              ),
            ),
            Padding(padding: EdgeInsets.all(15)),
            Text("La eleccion de $_botonPulsado es: ", style: TextStyle(color: Colors.purple[300], fontSize: 20),),
            Padding(padding: EdgeInsets.all(15)),
            Text('$_opcion', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
//SimpleDialog
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
      _opcionElegida("Coche",1);
        break;
      case ListaOpciones.Avion:
        _opcionElegida("Avion",1);
        break;
      case ListaOpciones.Barco:
        _opcionElegida("Barco",1);
        break;
    }
  }


  //BottomSheet
  Future<void> _elegirOpcionBottomSheet() async{
    switch(
    await showModalBottomSheet(context: context,
        builder: (BuildContext context){
          return Center(
            child: Container(
              color: Colors.purple[400],
              child: Column(
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
            Divider(),
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
            Divider(),
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
            )
                ],
              ),
            )
          );
        })

    ){
      case ListaOpciones.Coche:
        _opcionElegida("Coche",2);
        break;
      case ListaOpciones.Avion:
        _opcionElegida("Avion",2);
        break;
      case ListaOpciones.Barco:
        _opcionElegida("Barco",2);
        break;
    }
  }


  //ActionSheetCupertino
  Future<void> _elegirActionSheetCupertino() async{
    switch(
    await showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context){
          return CupertinoActionSheet(
            title: Text("Elige una Opcion Cupertino"),
            actions: [
              CupertinoActionSheetAction(
                  onPressed: (){
                    Navigator.pop(context, ListaOpciones.Coche);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.directions_car),
                      Text(" Coche")
                    ],
                  )
              ),
              CupertinoActionSheetAction(
                  onPressed: (){
                    Navigator.pop(context, ListaOpciones.Avion);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.airplanemode_active),
                      Text(" Avion")
                    ],
                  )
              ),
              CupertinoActionSheetAction(
                  onPressed: (){
                    Navigator.pop(context, ListaOpciones.Barco);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.directions_boat),
                      Text(" Barco")
                    ],
                  )
              )
            ],
          );
        }
        )
    ){
      case ListaOpciones.Coche:
        _opcionElegida("Coche",3);
        break;
      case ListaOpciones.Avion:
        _opcionElegida("Avion",3);
        break;
      case ListaOpciones.Barco:
        _opcionElegida("Barco",3);
        break;
    }
  }



  void _opcionElegida (String opcion, int identificador){
    setState(() {
      switch (identificador) {
        case 1:
          _botonPulsado = 'SimpleDialog';
          break;
        case 2:
          _botonPulsado = 'BottomSheet';
          break;
        case 3:
          _botonPulsado = 'ActionSheetCupertino';
          break;
      }
      _opcion = opcion;
    });

  }
}



enum ListaOpciones {
  Coche,
  Avion,
  Barco,
}
