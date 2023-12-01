import 'package:animator/PlanetProvider.dart';
import 'package:animator/SplashScreen.dart';
import 'package:animator/ThemeModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isDark = prefs.getBool('appTheme') ?? false;
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => PlanetProvider(),),
    ChangeNotifierProvider(create: (context) => ThemeProvider(themeModel: ThemeModel(isDark: isDark)),),
  ],child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: (Provider.of<ThemeProvider>(context).themeModel.isDark)
          ? ThemeMode.dark
          : ThemeMode.light,
     debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
  }
}

