import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camara App',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Camara App'),
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

  XFile? _imagefile;
  dynamic _pick;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: _visualizarImagen(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.purpleAccent,
              child: Icon(Icons.photo),
              onPressed: (){
              _onImageButtonPressed(ImageSource.gallery
              );}
          ),
          FloatingActionButton(
            backgroundColor: Colors.purple,
              child: Icon(Icons.camera_enhance),
              onPressed: (){
              _onImageButtonPressed(ImageSource.camera
              );
            })
        ],
      ),
    );
  }
Widget _visualizarImagen(){
    if(_imagefile !=null){
      return Image.file(File(_imagefile!.path));
    }else if (_pick!=null){
      return Text("Error de recuperacion de imagen $_pick",
      textAlign: TextAlign.center,);
    }else{
      return Text("No hay imagen",
      textAlign: TextAlign.center,);
    }
    
}

void _onImageButtonPressed(ImageSource source) async{
    try{
      _imagefile = await ImagePicker().pickImage(
          source: source
      );
      setState(() {
      });
    }catch(e){
      _pick = e;

    };

}
}
