// lib/font_size_dialog.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'font_state.dart';

class FontSizeDialog extends StatefulWidget {
  final ValueChanged<double> onFontSizeChanged; // Callback for font size change
  final ValueChanged<bool> onBoldChanged; // Callback for bold state change

  FontSizeDialog({
    required this.onFontSizeChanged,
    required this.onBoldChanged,
  });

  @override
  _FontSizeDialogState createState() => _FontSizeDialogState();
}

class _FontSizeDialogState extends State<FontSizeDialog> {
  double _fontSize = 18.0; // Default font size
  bool _isBold = false; // State variable for bold text

  @override
  void initState() {
    super.initState();
    // Initialize with current settings from provider if needed
    final settings = Provider.of<FontSettings>(context, listen: false);
    _fontSize = settings.fontSize;
    _isBold = settings.isBold;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Adjust Text Size'),
      content: Container(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Slider(
              value: _fontSize,
              min: 10,
              max: 30,
              divisions: 20,
              label: _fontSize.round().toString(),
              onChanged: (double newValue) {
                setState(() {
                  _fontSize = newValue; // Update local font size
                  widget.onFontSizeChanged(newValue); // Call the callback
                });
              },
            ),
            //SizedBox(height: 20),
            CheckboxListTile(
              title: Text('Bold Text'),
              value: _isBold,
              onChanged: (bool? newValue) {
                setState(() {
                  _isBold = newValue ?? false; // Update bold state
                  widget.onBoldChanged(_isBold); // Call the callback for bold state
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Close'),
        ),
      ],
    );
  }
}