import 'package:animator/PlanetScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Splashscreenstate();
  }
}
class Splashscreenstate extends State<SplashScreen> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    Future.delayed(Duration(seconds: 3),() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlanetScreen(),));
    },);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: Container(
          height: 820,
          width: 400,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('Assates/Images/Splashscreenanimator.jpg',),fit: BoxFit.fill,repeat: ImageRepeat.noRepeat),
          ),
        ),
      ),
    );
  }
}