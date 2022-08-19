import 'package:chao_jobs_website/ResponsivePages/large_screen.dart'
    deferred as a;
import 'package:chao_jobs_website/ResponsivePages/medium_screen.dart'
    deferred as b;
import 'package:chao_jobs_website/ResponsivePages/small_screen.dart'
    deferred as c;
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
          return FutureBuilder<void>(
            future: a.loadLibrary(),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return a.LargeScreen(type: Screen.LARGE);
              }
              return CircularProgressIndicator();
            },
          );
        } else if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 800) {
          return FutureBuilder<void>(
            future: b.loadLibrary(),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return b.MediumScreen(type: Screen.MEDIUM);
              }
              return const CircularProgressIndicator();
            },
          );
        } else {
          return FutureBuilder<void>(
            future: c.loadLibrary(),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return c.SmallScreen(type: Screen.SMALL);
              }
              return const CircularProgressIndicator();
            },
          );
        }
      },
    );
  }
}
