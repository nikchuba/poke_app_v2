import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/libraries/ui/layout/presenter.dart';

abstract class IScreen<P extends IPresenter, V extends Widget>
    extends StatelessWidget {
  const IScreen({
    super.key,
    P? presenter,
    required V view,
  })  : _presenter = presenter,
        _view = view;

  final P? _presenter;
  final V _view;

  @override
  Widget build(BuildContext context) {
    return Provider<P?>(
      create: (_) => _presenter,
      dispose: (_, presenter) => presenter?.dispose(),
      child: _view,
    );
  }
}
