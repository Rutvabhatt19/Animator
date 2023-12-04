import 'package:animator/Bookmark.dart';
import 'package:animator/PlanetProvider.dart';
import 'package:animator/ThemeModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bookmarkpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Bookmarkpagestate();
  }
}

class Bookmarkpagestate extends State<Bookmarkpage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ThemeProvider themeProvider, child) {
        return Consumer(
          builder: (context, PlanetProvider planetProvider, child) {
            // TODO: implement build
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
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
              body: Consumer(
                builder: (context, Bookmark bookmark, child) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: bookmark.stringList.isNotEmpty
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Center(
                                        child: Text(
                                      "Your BookMarks",
                                      style: TextStyle(
                                          color: themeProvider.themeModel.isDark
                                              ? Colors.white
                                              : Colors.black),
                                    )),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Icons.cancel_outlined,
                                          color: themeProvider.themeModel.isDark
                                              ? Colors.white
                                              : Colors.black,
                                        ))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: bookmark.stringList.length,
                                  itemBuilder: (context, index) {
                                    String value = bookmark.stringList[index];
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            width: 300,
                                            height: 20,
                                            child: GestureDetector(
                                                onTap: () {},
                                                child: Text(value))),
                                        IconButton(
                                            onPressed: () =>
                                                bookmark.removeList(value),
                                            icon: Icon(Icons.cancel)),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          )
                        : Center(
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("You Don't have any Bookmarks Yet."),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Close")),
                            ],
                          )),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
