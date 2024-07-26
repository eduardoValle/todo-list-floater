import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_floater/main.dart';
import 'package:teste_floater/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => HomePage());
  }
}