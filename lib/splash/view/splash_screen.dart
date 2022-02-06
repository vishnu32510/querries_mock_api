import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_api/queries/view/queries_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splashScreen';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => SplashScreen());
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    delay();
  }

  Future delay() async {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, QueriesScreen.routeName, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width/2,
          height: MediaQuery.of(context).size.width/2,
            child: Lottie.asset("assets/lottie/lf30_editor_thpzt4i8.json")),
      ),
    );
  }
}
