import 'package:flutter/material.dart';
import 'package:untitled4/helpers/item_request.dart';
import 'package:untitled4/widgets/request_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final req = const RequestItem(url: 'https://jsonplaceholder.typicode.com/todos/1');

  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("HTTP request"),
        ),

        body: Center(
          child: HTTPWidget(req),
        ),
      ),
    );
  }
}

