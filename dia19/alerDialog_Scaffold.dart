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
                      //No permite cerrar el AlertDialog al clickear fuera de el
                      barrierDismissible: false,
                      builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("Titulo de AlertDialog"),
                      content: Text("Contenido del AlertDialog"),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.of(context).pop();
                        },
                            child: Text("Cerrar"))
                      ],
                    );
                      });
                },
                child: Text("Abrir AlertDialog"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                textStyle: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

}
