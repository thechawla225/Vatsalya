import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:vatsalya2/auth.dart';
import 'package:vatsalya2/root.dart';
import 'package:vatsalya2/foodnotifier.dart';

void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(
      create: (context) => FoodNotifier(),
    ),
  ],
  child: MyApp(),
));


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: RootPage(auth : new Auth()),
    );
  }
}