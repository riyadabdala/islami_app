import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/app_colors.dart';
import 'package:islami_app/models/hadeath_model.dart';

class HadithDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadith_details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadeahModel;
    return Scaffold(
      ///backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        iconTheme: IconThemeData(
          color: AppColors.primaryColor,
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: AppColors.secondColor,
            // child: Image.asset(
            //   'assets/images/souraDetailsImg.png', width: double.infinity,
            //   height: double.infinity,
            //   fit: BoxFit.fill,
            // ),
          ),
          Column(
            children: [
              SizedBox(
                height: 17,
              ),
              Text(
                args.title,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                ),
              ),
              Expanded(
                  child: ListView.builder(
                padding: EdgeInsets.only(top: 20),
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      args.content[index],
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  );
                },
                itemCount: args.content.length,
              ))
            ],
          )
        ],
      ),
    );
  }
}
