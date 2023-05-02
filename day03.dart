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

class _MyHomePageState extends State<MyHomePage> { //Estado (modificar en pantalla)
  Icon _corazon = Icon(Icons.favorite_border, color: Colors.white);
  bool _liked = false;
  int _elementoSeleccionado = 0;
  String textoAVisualizar = "0 : Home";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: (Text(widget.title!)),
        actions: [
          IconButton(
              onPressed: (){_likedChange();}, //una funcion dentro de otra funcion para hacerla funcionar
              icon: _corazon)
        ],
      ),
      //Menu estilo hamburguesa
      drawer: Drawer(
        child: Column(
          children: const [ //elemento constante, no cambia
            DrawerHeader(
                child: Text(
                    'Menu Drawer',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                )
                )
            ),
            Text('Enlace 1'),
            Text('Enlace 2'),
            Text('Enlace 3'),
          ]
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(textoAVisualizar,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),)
          ],
        )
      ),
      //Boton Corazon Rojo Flotante
      floatingActionButton: FloatingActionButton(
        onPressed: (){_likedChange();},
        backgroundColor: Colors.red,
        child: _corazon,
        //label: Text('Like!'), FloatingActionButton.extended y en vez de child: icon
      ),

      //menu de abajo
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.cyanAccent,
        items: const [ //todos los elementos que tendran nuestra navigation bar
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.supervised_user_circle,
            color: Colors.white,
          ),
            label: 'Cuenta'
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.assessment,
            color: Colors.white,
          ),
            label: 'Estadisticas'
          )
        ],
        currentIndex: _elementoSeleccionado,
        onTap: _itemPulsado,
      ),
    );
  }

//Funcion del corazon, si se le da click hace una cosa
  _likedChange() {
    setState(() { //setState para actualizar la app cada vez que se realice una accion
      if (_liked) {
        _corazon = Icon(Icons.favorite_border, color: Colors.white);
        _liked = false;
      } else {
        _corazon = Icon(Icons.favorite, color: Colors.white);
        _liked = true;
      }
    });

  }

  //Cambiar de Pantalla al seleccionar una opcion de navegacion
  void _itemPulsado(int index){
    setState((){
      _elementoSeleccionado = index;
      switch(_elementoSeleccionado) {
        case 0:
          textoAVisualizar = '$_elementoSeleccionado : Home';
          break;
        case 1:
          textoAVisualizar = '$_elementoSeleccionado : Cuenta';
          break;
        case 2:
          textoAVisualizar = '$_elementoSeleccionado : Estadisticas';
          break;
      }
    });
  }
}

