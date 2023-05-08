import 'package:flutter/material.dart';
import 'package:untitled/pantalla2.dart';
import 'package:untitled/pantalla3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Pantalla 1'),
      routes: <String, WidgetBuilder>{
        '/route1' : (BuildContext context) => MyHomePage(title: 'Pagina 1'),
        '/route2' : (BuildContext context) => PantallaDos(title: 'Pagina 2'),
        '/route3' : (BuildContext context) => PantallaTres(title: 'Pagina 3'),
      }
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
            Text(widget.title,
            style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.purple),),
            
            const Padding(padding: EdgeInsets.all(10)),
            
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/route2');
            },
                child: Text("Pasar a pantalla 2"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/route3');
            },
              child: Text("Pasar a pantalla 3"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),)
          ],
        ),
      ),

    );
  }
}
