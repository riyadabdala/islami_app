import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/constants/app_assets.dart';
import 'package:islami_app/core/theme/app_colors.dart';
import 'package:islami_app/features/layout/widgets/sure_content_item.dart';
import 'package:islami_app/models/sura_model.dart';

class QuranDetailsView extends StatefulWidget {
  static String routeName = "QuranDetails";

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  List<String> Verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (Verses.isEmpty) {
      loadSuraFile(args.index);
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.souraDetailsBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: AppColors.primaryColor,
          ),
          title: Text(
            args.suraNameEn,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 60),
              child: Text(
                args.suraNameAr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            Expanded(
              child: Verses.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ))
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return SuraContentItem(
                          content: Verses[index],
                          index: index,
                        );
                      },
                      itemCount: Verses.length,
                    ),
            )
          ],
        ),
      ),
    );
  }

  void loadSuraFile(int index) async {
    String suraContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> suraLines = suraContent.split('\n');

    Verses = suraLines;
    setState(() {});
  }
}
