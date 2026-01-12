import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.color, required this.onChange});

  final List<String> color;
  final Function(String) onChange;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (String color in widget.color)
          GestureDetector(
            onTap: () {
              _selectedColor = color;
              widget.onChange(_selectedColor!);
              setState(() {});
            },
            child: Container(
              margin: .only(right: 8),
              padding: .symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: .circular(5),
                border: .all(color: Colors.grey),
                color: _selectedColor == color ? AppColors.themeColor : null,
              ),
              child: Text(
                color,
                style: TextStyle(
                  color: _selectedColor == color ? Colors.white : null,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
