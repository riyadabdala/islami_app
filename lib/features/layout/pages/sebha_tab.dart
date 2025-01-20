import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_assets.dart';
import 'package:islami_app/core/theme/app_colors.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(AppAssets.sebhaBg),
      )),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppAssets.isalmiLogo,
                height: size.height * 0.25,
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Text(
                  'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/sebha_body.png',
                    width: 250,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
