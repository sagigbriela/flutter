import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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

  bool _opcion = false;

  RadioOpciones _opcionRadio = RadioOpciones.Avion;
  Icon _IconOpcionRadio = Icon(Icons.airplanemode_active);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Seleccione una opcion",
            style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold),
            ),
            Divider(),
            Text("Switch",
            style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 15),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(value: _opcion,
                    activeColor: Colors.green,
                    activeTrackColor: Colors.green[200],
                    inactiveThumbColor: Colors.red,
                    inactiveTrackColor: Colors.red[200],
                    onChanged: (value){
                  setState(() {
                    _opcion = value;
                  });
                    })
              ],
            ),
            Text(_opcion ? 'Activado' : 'Desactivado'),
            CupertinoSwitch(value: _opcion,
                onChanged: (value){
                  setState(() {
                    _opcion = value;
                  });
                },
                  activeColor: Colors.blue[100],
                  trackColor: Colors.indigo[900],
                  thumbColor: _opcion ? Colors.amber : Colors.grey[200],),
            Divider(),
            Text("Radio",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(value: RadioOpciones.Coche,
                    groupValue: _opcionRadio,
                    onChanged: (value){
                  setState(() {
                    _opcionRadio = RadioOpciones.Coche;
                    _IconOpcionRadio = Icon(Icons.directions_car);
                    
                  });
                    }),
                Text("Coche"),
                Radio(value: RadioOpciones.Avion,
                    groupValue: _opcionRadio,
                    onChanged: (value){
                      setState(() {
                        _opcionRadio = RadioOpciones.Avion;
                        _IconOpcionRadio = Icon(Icons.airplanemode_active);
                      });
                    }),
                Text("Avion"),
                Radio(value: RadioOpciones.Barco,
                    groupValue: _opcionRadio,
                    onChanged: (value){
                      setState(() {
                        _opcionRadio = RadioOpciones.Barco;
                        _IconOpcionRadio = Icon(Icons.directions_boat);
                      });
                    }),
                Text("Barco"),
              ],
            ),
          _IconOpcionRadio,
          ],
    ),
      )
    );
  }


}

enum RadioOpciones{
  Coche,
  Avion,
  Barco,
}




