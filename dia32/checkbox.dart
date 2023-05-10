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

  Map _opcionCheckbox = {
    RadioOpciones.Coche : false,
    RadioOpciones.Avion : false,
    RadioOpciones.Barco : false,
  };

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
        children: [
           Text("Checkbox",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(value: _opcionCheckbox[RadioOpciones.Coche],
                  onChanged: (value){
                setState(() {
                  _opcionCheckbox[RadioOpciones.Coche] = value;
                });
                  }),

              Text("Coche"),
              Checkbox(value: _opcionCheckbox[RadioOpciones.Avion],
                  onChanged: (value){
                    setState(() {
                      _opcionCheckbox[RadioOpciones.Avion] = value;
                    });
                  }),
              Text("Avion"),
              Checkbox(value: _opcionCheckbox[RadioOpciones.Barco],
                  onChanged: (value){
                    setState(() {
                      _opcionCheckbox[RadioOpciones.Barco] = value;
                    });
                  }),
              Text("Barco"),
            ],
          )
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




