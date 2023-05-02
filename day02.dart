import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Zelda Home'),
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
      //Boton Corazon Rojo Flotante
      floatingActionButton: FloatingActionButton(
        onPressed: (){_likedChange();},
        backgroundColor: Colors.red,
        child: _corazon,
        //label: Text('Like!'), FloatingActionButton.extended y en vez de child: icon
      ),
      //Barra de Navegacion de abajo
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: null,
                  icon: Icon(Icons.camera_enhance, color: Colors.white)),
              IconButton(
                  onPressed: null,
                  icon: Icon(Icons.arrow_back, color: Colors.white))
            ]
        ),
        ),
      ),
    );
  }
//Funcion del corazon, si se le da click hace una cosa 
  _likedChange() {
    setState(() { //setState para actualizar la app cada vez que se realice una accion
      if (_liked) {
        _corazon = Icon(Icons.favorite_border, color: Colors.white);
        _liked = false;
      } else {
        _corazon = Icon(Icons.favorite, color: Colors.white);
        _liked = true;
      }
    });

  }
}