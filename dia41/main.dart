import 'dart:js';

import 'package:flutter/material.dart';
import 'package:untitled6/peroqpasaps/contador_provider.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/widgets/animated_container_widget.dart';
import 'package:untitled6/widgets/increment_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(
          create: (_) => ContadorProvider(20),
          child: Scaffold(
            appBar: AppBar(
              title: Text("Animated App"),
            ),
            body: Center(
              child: AnimatedContainerWidget(),
            ),
            floatingActionButton: IncrementWidget(),
          )
        )
    );
  }
}
