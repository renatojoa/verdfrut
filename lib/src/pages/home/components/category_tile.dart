import 'package:flutter/material.dart';
import 'package:greengroocer/src/config/custom_colors.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile(
    {
      super.key, 
      required this.category,
      required this.isSelected, required this.onPressed,
    }
    );

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected ? CustomColors.customWhitechColor : Colors.transparent,
            ),
            child: Text(
              category,
              style: TextStyle(
                color: isSelected ? Colors.white : CustomColors.customPurpleColor, 
                fontWeight:  FontWeight.bold,
                fontSize: isSelected ? 16 : 14,
              ),
              ),
          ),
        ),
      ),
    );
  }
}