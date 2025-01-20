import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_assets.dart';
import 'package:islami_app/features/layout/pages/layout_page.dart';

class SplashPage extends StatefulWidget {
  static String routeName = '/splash';
  static Duration _duration = Duration(
    milliseconds: 1750,
  );

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, LayoutPage.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppAssets.splashBg),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            FadeInDown(
              duration: SplashPage._duration,
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  AppAssets.splashGlow,
                  height: size.height * 0.30,
                ),
              ),
            ),
            ZoomIn(
              duration: SplashPage._duration,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppAssets.splashLogo,
                  height: size.height * 0.25,
                ),
              ),
            ),
            FadeInUp(
              duration: SplashPage._duration,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  AppAssets.splashBrand,
                  height: size.height * 0.25,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: size.height * 0.25),
              child: FadeInLeft(
                duration: SplashPage._duration,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    AppAssets.splashLeftShape,
                    height: size.height * 0.30,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.25),
              child: FadeInRight(
                duration: SplashPage._duration,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    AppAssets.splashRightShape,
                    height: size.height * 0.30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
