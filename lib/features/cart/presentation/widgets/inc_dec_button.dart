import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class IncDecButton extends StatefulWidget {
  const IncDecButton({super.key, required this.onChange});

  final Function(int) onChange;

  @override
  State<IncDecButton> createState() => _IncDecButtonState();
}

class _IncDecButtonState extends State<IncDecButton> {
  int _currentValue = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        buildGestureDetector(
          onTap: () {
            setState(() {
              if (_currentValue == 1) return;
              _currentValue--;
              widget.onChange(_currentValue);
            });
          },
          icon: Icons.remove,
        ),

        Text("$_currentValue", style: TextTheme.of(context).titleLarge),

        buildGestureDetector(
          onTap: () {
            setState(() {
              if (_currentValue == 10) return;
              _currentValue++;
              widget.onChange(_currentValue);
            });
          },
          icon: Icons.add,
        ),
      ],
    );
  }

  Widget buildGestureDetector({
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: .all(2),
        decoration: BoxDecoration(
          color: AppColors.themeColor,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Icon(icon, size: 22, color: Colors.white),
      ),
    );
  }
}
