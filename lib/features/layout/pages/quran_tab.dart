import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_assets.dart';
import 'package:islami_app/core/theme/app_colors.dart';
import 'package:islami_app/features/layout/widgets/quran_details_view.dart';
import 'package:islami_app/features/layout/widgets/recent_card_widget.dart';
import 'package:islami_app/features/layout/widgets/sura_card_widget.dart';

import '../../../models/sura_model.dart';

class QuranTab extends StatelessWidget {
  QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppAssets.quranBg),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.isalmiLogo),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                cursorColor: AppColors.primaryColor,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.titleTextColor,
                ),
                decoration: InputDecoration(
                    hintText: "Sura Name",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.titleTextColor,
                    ),
                    fillColor: AppColors.secondColor.withOpacity(0.5),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageIcon(
                        AssetImage("assets/icons/quran.png"),
                        color: AppColors.primaryColor,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Most Recently",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.titleTextColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 155,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => RecentCardWidget(
                  suraModel: SuraModel.getSuraModel(index),
                ),
                itemCount: SuraModel.numberOfVerseList.length,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sura List",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.titleTextColor,
                  ),
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, QuranDetailsView.routeName,
                      arguments: SuraModel.getSuraModel(index));
                },
                child: SuraCardWidget(
                  suraModel: SuraModel.getSuraModel(index),
                ),
              ),
              itemCount: SuraModel.numberOfVerseList.length,
              separatorBuilder: (context, index) => Divider(
                endIndent: 60,
                indent: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
