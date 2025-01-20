import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/constants/app_assets.dart';
import 'package:islami_app/core/theme/app_colors.dart';
import 'package:islami_app/features/layout/widgets/hadith_details_screen.dart';
import 'package:islami_app/models/hadeath_model.dart';

class HadithTab extends StatefulWidget {
  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadeahModel> hadeathList = [];

  @override
  Widget build(BuildContext context) {
    if (hadeathList.isEmpty) {
      loadHadeathFile();
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppAssets.hadihBg),
        ),
      ),
      child: Container(
        child: Column(
          children: [
            Image.asset(AppAssets.isalmiLogo),
            hadeathList.isEmpty
                ? CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  )
                : CarouselSlider.builder(
                    options: CarouselOptions(
                        height: 350,
                        viewportFraction: 0.75,
                        scrollDirection: Axis.horizontal,
                        enableInfiniteScroll: true,
                        enlargeCenterPage: true),
                    itemCount: hadeathList.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            HadithDetailsScreen.routeName,
                            arguments: hadeathList[itemIndex]);
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.primaryColor,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/Hadith Card.png'),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              hadeathList[itemIndex].title,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Expanded(
                                child:
                                    Text(hadeathList[itemIndex].content.join()))
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void loadHadeathFile() async {
    for (int i = 1; i <= 50; i++) {
      String hadeathContent =
          await rootBundle.loadString('assets/files/h$i.txt');
      List<String> hadeathLines = hadeathContent.split('\n');

      String title = hadeathLines[0];

      ///title
      hadeathLines.removeAt(0); ////re
      HadeahModel hadeahModel =
          HadeahModel(content: hadeathLines, title: title);
      hadeathList.add(hadeahModel); // mov
      setState(() {}); // e title
    }
  }
}
