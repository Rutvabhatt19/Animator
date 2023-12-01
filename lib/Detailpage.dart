import 'package:animator/PlanetProvider.dart';
import 'package:animator/PlanetScreen.dart';
import 'package:animator/ThemeModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Detailpage extends StatefulWidget {
  int index = 0;
  Detailpage(this.index);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Detailpagestate(index: index);
  }
}

class Detailpagestate extends State<Detailpage> with TickerProviderStateMixin {
  int index = 0;
  Detailpagestate({required this.index});
  late AnimationController _animationController;
  late Animation sizeanimation;
  Tween<double> _opacityTween = Tween<double>(
    begin: 0.0,
    end: 1.0,
  );
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    sizeanimation =
        Tween<double>(begin: 100, end: 400).animate(_animationController);
    _animationController.addStatusListener((status) {
      setState(() {});
    });
    _animationController.forward();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    animationController.addListener(() {
      setState(() {

      });
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer(
      builder: (context, PlanetProvider planetProvider, child) {
        return Consumer(
          builder: (context, ThemeProvider themeProvider, child) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Hero(
                  tag: planetlist[index],
                  child: Text(
                    planetlist[index].name,
                    style: TextStyle(
                        color: themeProvider.themeModel.isDark
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                ),
                automaticallyImplyLeading: false,
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: themeProvider.themeModel.isDark
                          ? Colors.white
                          : Colors.black,
                    )),
                actions: [
                  IconButton(
                      onPressed: () {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .changeTheme();
                      },
                      icon: Icon(
                        themeProvider.themeModel.isDark
                            ? Icons.light
                            : Icons.dark_mode_outlined,
                        color: themeProvider.themeModel.isDark
                            ? Colors.white
                            : Colors.black,
                      )),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Center(
                        child: Image.network(
                          planetlist[index].image,
                          height: sizeanimation.value,
                          width: sizeanimation.value,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                        opacity: _opacityTween.evaluate(animationController),
                        duration: Duration(seconds: 3),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 30, right: 20, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name : ${planetlist[index].name}',
                                style: TextStyle(
                                  color: themeProvider.themeModel.isDark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  'Position in solar system : ${planetlist[index].position}',
                                  style: TextStyle(
                                    color: themeProvider.themeModel.isDark
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  'Velocity : ${planetlist[index].velocity}',
                                  style: TextStyle(
                                    color: themeProvider.themeModel.isDark
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  'Distance from Sun : ${planetlist[index].distance}',
                                  style: TextStyle(
                                    color: themeProvider.themeModel.isDark
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  'Description : ${planetlist[index].description}',
                                  style: TextStyle(
                                    color: themeProvider.themeModel.isDark
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // Widget TweenAnim(){
  //   return TweenAnimationBuilder<double>(
  //     tween: Tween<double>(begin: 300,end: 600),
  //     duration: Duration(seconds: 2),
  //     builder: (context, double size, child) {
  //       return Image.network(planetlist[index].image,height: size,width: size,);
  //     },);
  // }
  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    animationController.dispose();
    super.dispose();
  }
}
