import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'AlertDialogo App'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});


  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  showDialog(context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context){
                    return CupertinoAlertDialog(
                      title: Text("Titulo de AlertDialog"),
                      content: Text("Contenido de AlertDialog"),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.of(context).pop();
                        },
                            child: Text("Cerrar"))
                      ],
                    );
                  });
                },
                child: Text("Abrir AlertDialog Cupertino"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: TextStyle(color: Colors.white),)
            )
          ],
        ),
      ),
    );
  }
