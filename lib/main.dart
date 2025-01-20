import 'package:flutter/material.dart';
import 'package:islami_app/features/layout/widgets/hadith_details_screen.dart';
import 'package:islami_app/features/layout/widgets/quran_details_view.dart';

import 'features/layout/pages/layout_page.dart';
import 'features/splash/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (_) => SplashPage(),
        LayoutPage.routeName: (_) => LayoutPage(),
        QuranDetailsView.routeName: (_) => QuranDetailsView(),
        HadithDetailsScreen.routeName: (_) => HadithDetailsScreen(),
      },
    );
  }
}
