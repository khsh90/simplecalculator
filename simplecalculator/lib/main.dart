import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import './screens/mainscreen.dart';
import './provider/buttondata.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ButtonData(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dandooneh Calculator',
        theme: ThemeData(primaryColor: Colors.blue),
        home: Calculator(),
      ),
    );
  }
}
