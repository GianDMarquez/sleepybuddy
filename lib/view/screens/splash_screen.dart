import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sleeplist/main.dart';

import '../colors.dart';

class SplashScreen extends StatefulWidget  {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
  with SingleTickerProviderStateMixin {

//if bars get rid of bars
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const MyHomePage(),
        ));
    });
  }

// get bars back
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondaryColorDark,
      child: Center(
        child: Image.asset("lib/images/logo_name_n_buddy.png"),
        //logo_shortened.png
        //logo_name_n_buddy.png
      ),
    );
  }
}