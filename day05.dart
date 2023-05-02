import 'package:flutter/cupertino.dart';
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

class _MyHomePageState extends State<MyHomePage> {
  //Estado (modificar en pantalla)

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      //Barra de Navegacion en el Top
        navigationBar: const CupertinoNavigationBar(
        backgroundColor: Colors.black26,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        middle: Text('Titulo de Pagina',
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
        //El Texto en el medio de la Pantalla
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Aplicacion barra Navegacion',
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 20,
                color: Colors.black,
              ),
              )
            ],
          ),
        ),
    );
  }//widget build
}//State<MyHomePage>