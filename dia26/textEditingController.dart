import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextField',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'TextField'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});


  final String title;



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _textoIntroducio = "Ningun texto introducido";

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Formulario',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Container(
                    height: MediaQuery.of(context).size.height*0.7,
                    width: MediaQuery.of(context).size.width*0.9,
                    child: Column(
                      children: [
                        Text("Texto"),
                        TextField(
                          decoration: const InputDecoration(
                              hintText: 'Introduce tu Texto',
                          ),
                          controller: _controller,
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        Container(
                          color: Colors.purple[100],
                          width: MediaQuery.of(context).size.width*0.9,
                          child: Column(
                            children: [
                              const Text("Tu texto Introducido es: ",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                              Text("$_textoIntroducio"),
                            ],
                          )
                        )

                      ],
                    )
                ),
              ],
            ),
          ),
        )
    );
  }

  @override
  void initState(){
    super.initState();
    _controller.addListener(_mostrarValorIntroducido);
    _controller.value = TextEditingValue(text: "Valor inicial");
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  void _mostrarValorIntroducido(){
    setState(() {
      _textoIntroducio = _controller.text;
    });
  }
}
