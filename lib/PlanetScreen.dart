import 'package:animator/Bookmark.dart';
import 'package:animator/BookmarkShowpage.dart';
import 'package:animator/Detailpage.dart';
import 'package:animator/PlanetDataModal.dart';
import 'package:animator/PlanetProvider.dart';
import 'package:animator/ThemeModal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class PlanetScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PlanetScreenstate();
  }
}

List<PlanetData> planetlist = [];

class PlanetScreenstate extends State<PlanetScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PlanetProvider>(context, listen: false).Ontap();
    Provider.of<Bookmark>(context, listen: false).getListFromSharedPrefs();
    super.initState();
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
                automaticallyImplyLeading: false,
                backgroundColor: themeProvider.themeModel.isDark
                    ? Colors.black
                    : Colors.white,
                title: Text(
                  'PLANETS',
                  style: TextStyle(
                      letterSpacing: 2,
                      color: themeProvider.themeModel.isDark
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                actions: [
                  Consumer(
                    builder: (BuildContext context, Bookmark bookmark,
                        Widget? child) {
                      return IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Bookmarkpage(),
                            ));
                          },
                          icon: Icon(
                            bookmark.stringList.isNotEmpty
                                ? Icons.bookmark
                                : Icons.bookmark_outline,
                            color: themeProvider.themeModel.isDark
                                ? Colors.white
                                : Colors.black,
                          ));
                    },
                  ),
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
              body: Column(
                children: [
                  Container(
                    height: 720,
                    width: 430,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'Assates/Images/Splashscreenanimator.jpg'),
                          fit: BoxFit.fill,
                          repeat: ImageRepeat.noRepeat),
                    ),
                    child: ListView.builder(
                      itemCount: planetlist.length,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          child: SlideAnimation(
                            verticalOffset: 50,
                            child: FadeInAnimation(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Detailpage(index),
                                  ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 35, right: 20, bottom: 10),
                                  child: Container(
                                    height: 150,
                                    width: 420,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: themeProvider.themeModel.isDark
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                    child: Hero(
                                      tag: planetlist[index],
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 50, left: 20),
                                        child: Text(
                                          planetlist[index].name,
                                          style: TextStyle(
                                              color: themeProvider
                                                      .themeModel.isDark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 40),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
