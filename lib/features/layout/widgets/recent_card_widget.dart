import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/app_colors.dart';

import '../../../models/sura_model.dart';

class RecentCardWidget extends StatelessWidget {
  final SuraModel suraModel;

  const RecentCardWidget({super.key, required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(10),
      height: 150,
      // width: 185,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                suraModel.suraNameEn,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                suraModel.suraNameAr,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                suraModel.suraVerses,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Image.asset("assets/images/Recent sura.png"),
        ],
      ),
    );
  }
}
