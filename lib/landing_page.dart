import 'package:chao_jobs_website/ResponsivePages/large_screen.dart';
import 'package:chao_jobs_website/ResponsivePages/medium_screen.dart';
import 'package:chao_jobs_website/ResponsivePages/small_screen.dart';
import 'package:flutter/material.dart';

import 'functions.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  static const routeName = '/landing-page';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print("screen width: ${constraints.maxWidth}");
        if (constraints.maxWidth > 1200) {
          return const LargeScreen(type: Screen.LARGE);
        } else if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 800) {
          return const MediumScreen(type: Screen.MEDIUM);
        } else {
          return const SmallScreen(type: Screen.SMALL);
        }
      },
    );
  }
}
