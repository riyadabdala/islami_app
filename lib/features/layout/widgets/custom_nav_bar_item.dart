import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/app_colors.dart';

class CustomNavBarItems extends StatelessWidget {
  final int selectedIndex;
  final int navBarItem;
  final String iconPath;

  const CustomNavBarItems(
      {super.key,
      required this.selectedIndex,
      required this.navBarItem,
      required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: selectedIndex == navBarItem
              ? AppColors.secondColor.withValues(alpha: 0.5)
              : Colors.transparent,
        ),
        child: ImageIcon(
          AssetImage(iconPath),
        ),
      ),
    );
  }
}
