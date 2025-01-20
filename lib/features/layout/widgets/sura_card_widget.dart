import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/app_colors.dart';
import 'package:islami_app/models/sura_model.dart';

class SuraCardWidget extends StatelessWidget {
  SuraModel suraModel;

  SuraCardWidget({super.key, required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/icons/suraIcon.png")),
            ),
            child: Text(
              '${suraModel.index + 1}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${suraModel.suraNameAr}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${suraModel.suraVerses} Verses",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
            ],
          ),
          Spacer(),
          Text(
            '${suraModel.suraNameEn}',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
