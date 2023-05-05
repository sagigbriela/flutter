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
      home: MyHomePage(title: 'Snackbar'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});


  final String title;

  final SnackBar _snackBar = const SnackBar(
      content:
      Text("Ejemplo de Texto en SnackBar."),
      duration: Duration(seconds: 4),
    backgroundColor: Colors.red,
  );

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
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                    content:
                    Text("Ejemplo de Texto en SnackBar."),
                    duration: Duration(seconds: 4),
                    backgroundColor: Colors.red,
                        action: SnackBarAction(
                          label: "Cerrar",
                          textColor: Colors.white,
                          onPressed: (){
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                  ));
                },
                child: Text("Abrir SnackBar"),
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
