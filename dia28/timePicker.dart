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
        GlobalWidgetsLocalizations.delegate
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
  var _time = null;

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
                onPressed: _seleccionarFecha,
                child: const Text("Introducir Fecha Nacimiento"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  textStyle: TextStyle(
                    color: Colors.white
                  )
                ),
            ),
            const Padding(padding: EdgeInsets.all(10)),

            ElevatedButton(
              onPressed: _seleccionarHora,
              child: const Text("Introducir Hora Nacimiento"),
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
              _date == null ? 'Ninguna fecha ' : '${_date.day}/${_date.month}/${_date.year}'
              ,
            style:  const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),),
            const Padding(padding: EdgeInsets.all(10)),
            const Text("La Hora seleccionada es"),
            Text(
              _time == null ? 'Ninguna hora seleccionada ' : '${_time.format(context)}'
              ,
              style:  const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),),

            ]
    )
      )
    );
  }
  Future _seleccionarFecha () async{
    DateTime? _fechaSeleccionada = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime.now()
    );
    setState(() {
      if (_fechaSeleccionada != null) {
        _date = _fechaSeleccionada;
      }
    });


    }

  Future _seleccionarHora() async {
    TimeOfDay? _horaSeleccionada = await showTimePicker(context: context,
        initialTime: TimeOfDay.now()
    );
    setState(() {
      if (_horaSeleccionada != null) {
        _time = _horaSeleccionada;
      }
    });
  }
    }



