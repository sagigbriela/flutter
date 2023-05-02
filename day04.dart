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
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.cyanAccent,
          items: const [
             BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                 label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.supervised_user_circle,
                  color: Colors.white,
                ),
              label: 'Usuario',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.book,
                  color: Colors.white,
                ),
              label: 'Estadisticas'
            ),
          ],
        ),
        tabBuilder: (context,index){
          switch(index){
            case 0:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(
                  child: Center(
                    child: Column(
                      children: [
                        Text('$index : Mi Home'),
                    ],
                   ),
                  ),
                );
              });
            case 1:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(
                  child: Center(
                    child: Column(
                      children: [
                        Text('$index : Mi Cuenta'),
                      ],
                    ),
                  ),
                );
              });
            case 2:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(
                  child: Center(
                    child: Column(
                      children: [
                        Text('$index : Mis Estadisticas'),
                      ],
                    ),
                  ),
                );
              });
            default:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(
                  child: Center(
                    child: Column(
                      children: [
                        Text('$index : Mi Home'),
                      ],
                    ),
                  ),
                );
              });
          }
      },
    );
  }
}
