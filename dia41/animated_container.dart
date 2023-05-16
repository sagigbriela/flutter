import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/peroqpasaps/contador_provider.dart';

class AnimatedContainerWidget extends StatelessWidget{
  const AnimatedContainerWidget();

  @override
  Widget build(BuildContext context) {
    return Consumer<ContadorProvider>(
      builder: (context,status,_){
        return Container(
          height: status.counter,
          width: status.counter,
          color: Colors.amberAccent,
          alignment: Alignment.center,

        );
      },
    );
  }
}