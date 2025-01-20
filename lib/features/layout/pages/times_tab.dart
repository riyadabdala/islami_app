import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';

class TimesTab extends StatelessWidget {
  const TimesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(AppAssets.timesScreen),
      )),
    );
  }
}
