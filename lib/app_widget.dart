import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({key}); 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity:  VisualDensity.adaptivePlatformDensity,
      ),
            initialRoute: "/",
      // navigatorKey: Modular.navigatorKey,
       onGenerateRoute: Modular.generateRoute,
     initialRoute:  Modular.initialRoute,
    //  onGenerateRoute: Modular.generateRoute,
    );
  }
}
