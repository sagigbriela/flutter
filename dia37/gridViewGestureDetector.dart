import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'plantas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plantas',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Plantas'),
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

  List _plantas = [
    Plantas('planta1', 'verde', Image.asset('Assets/images/planta1.webp')),
    Plantas('planta2', 'verde', Image.asset('Assets/images/planta2.jpg')),
    Plantas('planta3', 'verde', Image.asset('Assets/images/planta3.jpg')),
    Plantas('planta4', 'rojo', Image.asset('Assets/images/planta4.jpeg')),
    Plantas('planta5', 'rojo', Image.asset('Assets/images/planta5.jpg')),
    Plantas('planta6', 'rojo', Image.asset('Assets/images/planta6.jpg')),
    Plantas('planta7', 'amarillo', Image.asset('Assets/images/planta7.jpg')),
    Plantas('planta8', 'amarillo', Image.asset('Assets/images/planta8.jpg')),
    Plantas('planta9', 'amarillo', Image.asset('Assets/images/planta9.jpg')),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: _plantas.length,
          itemBuilder: (context, index) {
            final item = _plantas.elementAt(index);
            return Card(
              color: Colors.grey[200],
              elevation: 5,
              //Elemento clickeable
              child: GestureDetector(
                onTap: (){
                  showDialog(context: context, builder: (BuildContext context)
                  {
                    return AlertDialog(
                      title: Text('${item.nombre}',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,),
                      ),
                      content: item.imagen,
                    );
                  });
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: item.imagen,
                        height: 80,
                      ),
                      Divider(color: Colors.white,),
                      Text("${item.nombre}",
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      ),
                      Text("${item.categoria}",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),)
                    ],
                  ),
                ),
              ),
            );

              /*GridTileBar(
              backgroundColor: Colors.grey[200],
              title: Container(
                constraints: BoxConstraints(
                  maxHeight: 100
                ),
                child: item.imagen,
              ),
              subtitle:
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text('${item.nombre}',
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                )
            );*/
          })
    );
  }


}