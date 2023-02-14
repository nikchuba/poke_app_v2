import 'package:flutter/widgets.dart';

class PopupView extends StatefulWidget {
  const PopupView({super.key, this.context});

  final BuildContext? context;

  @override
  State<PopupView> createState() => _PopupViewState();
}

class _PopupViewState extends State<PopupView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
