import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';

class ItemCounterWidget extends StatefulWidget {
  const ItemCounterWidget({super.key, required this.onChange});

  final Function(int) onChange;

  @override
  State<ItemCounterWidget> createState() => _ItemCounterWidgetState();
}

class _ItemCounterWidgetState extends State<ItemCounterWidget> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(
          onTap: () {
            if (value <= 1) return;
            value--;
            setState(() {});
            widget.onChange(value);
          },
          icon: Icons.remove,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text('$value', style: TextStyle(fontSize: 18)),
        ),
        _buildIconButton(
          onTap: () {
            if (value >= 20) return;
            value++;
            setState(() {});
            widget.onChange(value);
          },
          icon: Icons.add,
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColor.themeColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, size: 18, color: Colors.white),
      ),
    );
  }
}