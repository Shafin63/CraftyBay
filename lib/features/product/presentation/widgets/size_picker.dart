import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.size, required this.onChange});

  final List<String> size;
  final Function(String) onChange;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (String size in widget.size)
          GestureDetector(
            onTap: () {
              _selectedSize = size;
              widget.onChange(_selectedSize!);
              setState(() {});
            },
            child: Container(
              margin: .only(right: 8),
              padding: .symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: .circular(5),
                border: .all(color: Colors.grey),
                color: _selectedSize == size ? AppColors.themeColor : null,
              ),
              child: Text(
                size,
                style: TextStyle(
                  color: _selectedSize == size ? Colors.white : null,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
