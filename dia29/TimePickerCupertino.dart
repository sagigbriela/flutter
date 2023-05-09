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
      title: 'Fecha y Hora',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Fecha y Hora'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('es', 'ES')
      ],
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

  var _date = null;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: (){
                  showModalBottomSheet(context: context,
                      builder: (BuildContext context){
                    return Container(
                      child: _displayCalendar(),
                      height: MediaQuery.of(context).size.height/3,
                    );
                      });
                },
                child: const Text("Introducir Fecha Nacimiento"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  textStyle: TextStyle(
                    color: Colors.white
                  )
                ),
            ),
            const Padding(padding: EdgeInsets.all(10)),

            const Text("La Fecha seleccionada es"),

            Text(
              _date == null ? "Ninguna fecha seleccionada" : '${_date.day}/${_date.month}/${_date.year}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            ]
    )
      )
    );
  }

  Widget _displayCalendar(){
    return CupertinoDatePicker(
      initialDateTime: DateTime.now(),
        maximumDate: DateTime.now(),
        minimumDate: DateTime(1950),
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: (value){
        setState(() {
          _date = value;
        });
        }
    );
  }
}



