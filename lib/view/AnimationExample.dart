import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
class AnimationExample extends StatefulWidget {
  const AnimationExample({Key? key}) : super(key: key);

  @override
  State<AnimationExample> createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> myanimation;


  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    animationController=new AnimationController(
      duration: Duration(seconds: 1),vsync: this,
    );
    myanimation=Tween<double>(begin: 0.0,end: 1).animate(animationController);

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        AnimatedBuilder(animation: myanimation , builder: (BuildContext context,Widget? child){
           return Container(
             width: 130,height: 130,
             color: Colors.red,
           );
        })
        ],),
    );
  }
}


