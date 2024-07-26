import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_floater/modules/detalhe/detalhe_page.dart';

class DetalheModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/:id', child: (context) => DetalhePage(id: int.parse(r.args.params['id'])));
  }
}
