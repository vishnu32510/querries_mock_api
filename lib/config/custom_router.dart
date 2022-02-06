import 'package:flutter/material.dart';
import 'package:mock_api/screens_barrel.dart';

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings){
print("Route : ${settings.name}");
switch(settings.name){
  case SplashScreen.routeName:
    return SplashScreen.route();
  case QueriesScreen.routeName:
    return QueriesScreen.route();
  default:
    return _errorRoute();
}
  }
  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Error Page')),
          ),
        ));
  }
}