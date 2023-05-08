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

  TextStyle style1 = TextStyle(
    color: Colors.yellow[400]
  );

  TextStyle style2 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15
  );

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _textoAlCambiar = 'Ningun texto introducido';
  String _textoEnviado = 'Ningun texto enviado';


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
                    Text("Introduce tu nombre"),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Introduce tu Nombre'
                      ),
                      onChanged: (value){
                        setState(() {
                          _textoAlCambiar = value;
                        });
                      },
                      onSubmitted: (value){
                        setState(() {
                          _textoEnviado = value;
                        });
                      },
                    ),
                    Padding(padding: EdgeInsets.all(10)),

                    Container(
                      width: MediaQuery.of(context).size.width*0.8,
                      decoration: BoxDecoration(
                        color: Colors.purple[200],
                        boxShadow: const [BoxShadow( color: Colors.black,
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: Offset(0,1))],
                      ),
                      //color: Colors.purple[200],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(padding: EdgeInsets.all(5)),
                          Text('1.-Texto que se esta introduciendo en directo',
                            style: widget.style1,),
                          Text('$_textoAlCambiar',
                            style: widget.style2,),
                          Text('2.- Texto que se la enviado en el TextField',
                            style: widget.style1,),
                          Text('$_textoEnviado',
                            style: widget.style2,),
                        ],
                      ),
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
}
