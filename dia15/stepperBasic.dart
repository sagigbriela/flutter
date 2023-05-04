
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
  List<Step> steps = [
    Step(title: Text("Caja 1"), content: Text("Contenido de Caja 1")),
    Step(title: Text("Caja 2"), content: Text("Contenido de Caja 2")),
    Step(title: Text("Caja 3"), content: Text("Contenido de Caja 3")),
    Step(title: Text("Caja 4"), content: Text("Contenido de Caja 4")),
    Step(title: Text("Caja 5"), content: Text("Contenido de Caja 5")),
  ];

  int _currentSteps = 0;

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
           Text("Stepper", style: Theme.of(context).textTheme.displayMedium,),
           Stepper(
               steps: steps,
             currentStep: _currentSteps,
             onStepContinue: _pasoSiguiente,
             onStepCancel: _pasoAnterior,

           )
         ],
       ),

     ),
   );
  }

  void _pasoSiguiente(){
    setState(() {
      _currentSteps++;
    });
  }

  void _pasoAnterior(){
    setState(() {
      _currentSteps--;
    });
  }

}