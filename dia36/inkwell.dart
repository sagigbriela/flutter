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
      body: ListView.builder(
          itemCount: _plantas.length,
          itemBuilder: (context, index){
            final item = _plantas[index];
            return Dismissible(
              key: Key(item.nombre),
              background: Container(
                child: Icon(
                  Icons.delete,
                  size: 40,
                  color: Colors.lightGreen,
                ),
                color: Colors.lightGreenAccent,
              ),
              onDismissed: (direction){
                setState(() {
                  _plantas.removeAt(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${item.nombre} ha sido borrado"))
                  );
                });
              },
              child: Card(
                shadowColor: Colors.purpleAccent,
                child: Container(
                  height: 70,
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${item.nombre}',
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text('${item.categoria}',
                        style: TextStyle(
                          color: Colors.green[200],
                          fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                    onDoubleTap: (){
                      setState(() {
                        _plantas.removeAt(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("${item.nombre} ha sido borrado"))
                        );
                      });
                    },
                    onTap: (){
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialog(
                          title: Text('${item.nombre}',
                          style:  TextStyle(
                          color: Colors.amber,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,),
                          ),
                          content: item.imagen,
                        );
                      });
                    },
                  ),
                ),
              ),
            );
          }
      ),
    );
  }


}

