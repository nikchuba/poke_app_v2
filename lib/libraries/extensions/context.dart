import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/libraries/ui/layout/presenter.dart';

extension PresenterContext on BuildContext {
  T presenter<T extends IPresenter>() => read<T>();
}
