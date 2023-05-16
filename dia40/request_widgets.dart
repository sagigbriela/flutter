import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/helpers/base_request.dart';

import '../models/item.dart';

class HTTPWidget extends StatefulWidget{

  final HTTPRequest<Item> _request;
  const HTTPWidget(this._request);

  @override
  _HTTPWidgetState createState() => _HTTPWidgetState();
}

class _HTTPWidgetState extends State<HTTPWidget>{
  late final Future<Item> futureItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureItem = widget._request.execute();
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: futureItem,
        builder: (BuildContext context, AsyncSnapshot<Item> snapshot){
         if(snapshot.hasError) {
           return Text("Error en los datos");
         }
         if(snapshot.hasData){
           Item? item = snapshot.data;
           if (item != null){
             return Text("${item.id} - ${item.title}");
           }else{
             return Text("No data to show");
           }
         }
         return CircularProgressIndicator();
        });
  }
}
