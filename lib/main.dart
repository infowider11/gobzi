import 'package:flutter/material.dart';
import 'package:gobzi/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'constants/colorsmodal.dart';
import 'constants/global_keys.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyColors()),
      ],
      child: const MyApp(),
    ),
    // const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return Consumer<MyColors> (builder: (context, color, child) {
     return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: MyGlobalKeys.navigatorKey,
        home: splash_screen(),
      );
    });
  }
}


