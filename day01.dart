import 'package:flutter/material.dart';

void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget { //clase padre //StatellesWidget significa una clase que no generara cambios
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GabrielaApp',
      home: MyHomePage(title: 'Zelda'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}):super(key:key); 

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> { 
  Icon _corazon = Icon(Icons.favorite_border, color: Colors.white);
  bool _liked = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: (Text(widget.title!)),
        actions: [
          IconButton(
              onPressed: (){_likedChange();}, //una funcion dentro de otra funcion para hacerla funcionar
              icon: _corazon)
        ],
      ),
    );
  }

  _likedChange() {
    setState(() { //setState para actualizar la app cada vez que se realice una accion
      if (_liked) {
        _corazon = Icon(Icons.favorite_border, color: Colors.white);
        _liked = false;
      } else {
        _corazon = Icon(Icons.favorite, color: Colors.red);
        _liked = true;
      }
    });

  }
}