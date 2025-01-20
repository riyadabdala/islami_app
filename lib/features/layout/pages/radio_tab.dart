import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_assets.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(AppAssets.radioScreen),
      )),
    );
  }
}
