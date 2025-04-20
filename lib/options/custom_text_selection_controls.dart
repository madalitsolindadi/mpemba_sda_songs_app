// custom_toolbar.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextSelectionToolbar extends StatelessWidget {
  final EditableTextState editableTextState;

  const CustomTextSelectionToolbar({Key? key, required this.editableTextState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ContextMenuButtonItem> buttonItems = editableTextState.contextMenuButtonItems;

    return AdaptiveTextSelectionToolbar.buttonItems(
      anchors: editableTextState.contextMenuAnchors,
      buttonItems: buttonItems,
    );
  }
}