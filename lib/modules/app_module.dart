import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_floater/core/pages/splash_page.dart';
import 'package:teste_floater/modules/detalhe/detalhe_module.dart';
import 'package:teste_floater/modules/home/home_module.dart';
import 'package:teste_floater/modules/inclusao/inclusao_module.dart';
import 'package:teste_floater/stores/todo_store.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(TodoStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => SplashPage(), transition: TransitionType.fadeIn);
    r.module('/home', module: HomeModule(), transition: TransitionType.fadeIn);
    r.module('/detalhe', module: DetalheModule(), transition: TransitionType.fadeIn);
    r.module('/inclusao', module: InclusaoModule(), transition: TransitionType.fadeIn);
  }
}
