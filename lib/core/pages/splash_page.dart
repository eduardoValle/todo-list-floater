import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatelessWidget {

  SplashPage({super.key}) {
    Future.delayed(Duration(seconds: 2), () {
      Modular.to.navigate('/home');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/images/logo.png')),
    );
  }
}
