import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_assets.dart';
import 'package:islami_app/core/theme/app_colors.dart';
import 'package:islami_app/features/layout/pages/hadith_tab.dart';
import 'package:islami_app/features/layout/pages/quran_tab.dart';
import 'package:islami_app/features/layout/pages/radio_tab.dart';
import 'package:islami_app/features/layout/pages/sebha_tab.dart';
import 'package:islami_app/features/layout/pages/times_tab.dart';

import '../widgets/custom_nav_bar_item.dart';

class LayoutPage extends StatefulWidget {
  static String routeName = "/layout";

  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimesTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          selectedIndex = index;
          setState(() {});
        },
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primaryColor,
        fixedColor: AppColors.white,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: CustomNavBarItems(
                selectedIndex: selectedIndex,
                navBarItem: 0,
                iconPath: AppAssets.quranIcn,
              ),
              label: "Quran"),
          BottomNavigationBarItem(
              icon: CustomNavBarItems(
                selectedIndex: selectedIndex,
                navBarItem: 1,
                iconPath: AppAssets.hadihIcn,
              ),
              label: "Hadith"),
          BottomNavigationBarItem(
              icon: CustomNavBarItems(
                selectedIndex: selectedIndex,
                navBarItem: 2,
                iconPath: AppAssets.sebhaIcn,
              ),
              label: "Sebha"),
          BottomNavigationBarItem(
              icon: CustomNavBarItems(
                selectedIndex: selectedIndex,
                navBarItem: 3,
                iconPath: AppAssets.radioIcn,
              ),
              label: "Radio"),
          BottomNavigationBarItem(
              icon: CustomNavBarItems(
                selectedIndex: selectedIndex,
                navBarItem: 4,
                iconPath: AppAssets.timesIcn,
              ),
              label: "Times"),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
