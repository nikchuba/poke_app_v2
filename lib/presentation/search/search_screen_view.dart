import 'package:flutter/material.dart';

class SearchScreenView extends StatefulWidget {
  const SearchScreenView({super.key, required this.context});

  final BuildContext context;

  @override
  State<SearchScreenView> createState() => _SearchScreenViewState();
}

class _SearchScreenViewState extends State<SearchScreenView> {
  MediaQueryData get media => MediaQuery.of(context);

  late final TextEditingController searchController;
  late final FocusNode searchFocus;
  late Offset minCenter;
  late Size minSize;
  late RenderBox box;
  late Offset startOffset;

  @override
  void initState() {
    searchController = TextEditingController(text: 'Search');
    searchFocus = FocusNode();

    box = widget.context.findRenderObject() as RenderBox;
    startOffset = box.localToGlobal(Offset.zero);
    minSize = box.size;

    // if (startOffset != null && minSize != null) {
    minCenter = startOffset.translate(minSize.width / 2, minSize.height / 2);
    // }

    final clientSize = media.size;
    final clientHeight = clientSize.height, clientWidth = clientSize.width;
    final maxCenter = Offset(clientWidth / 2, clientHeight / 2);
    final maxSize = clientSize;

    // minCenter ??= Offset(clientWidth / 2, clientHeight / 2);
    // minSize ??= const Size(100, 100);
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocus
      ..unfocus()
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Search'),
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacer(),
          TextField(
            autofocus: true,
            controller: searchController,
            focusNode: searchFocus,
          ),
        ],
      ),
    );
  }
}
