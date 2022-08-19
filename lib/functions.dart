import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

enum Screen { LARGE, MEDIUM, SMALL }

class Functions {
  static List<String> lang = ['arabic', "english", "french", 'portuguese'];

  static Map<String, String> hook = {
    'ar': "arabic",
    "en": "english",
    "fr": "french",
    "pt": "portuguese"
  };

  static Map<String, String> rhook = {
    "arabic": 'ar',
    "english": "en",
    "french": "fr",
    "portuguese": "pt",
  };

  static Map<String, Uri> url = {
    "assets/images/getiphone.png": Uri.parse("https://apple.co/3oN0A6e"),
    'assets/images/getandroid.png': Uri.parse("https://bit.ly/3QcTW4T")
  };
  static appBar([Screen? type]) {
    return AppBar(
        elevation: 0,
        toolbarHeight: 75,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: Get.locale!.languageCode == 'ar'
                  ? [downloadButton(), icon(type)]
                  : [icon(type), downloadButton()]),
        ));
  }

  static icon([Screen? type]) {
    return Get.locale!.languageCode == 'ar'
        ? Row(
            children: [
              Text("ChaoJobs",
                  style: GoogleFonts.lobster(fontSize: 25, color: Colors.blue)),
              const SizedBox(width: 8),
              SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    "assets/images/icon.png",
                    scale: 0.5,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(width: 16),
            ],
          )
        : Row(
            children: [
              const SizedBox(width: 16),
              SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    "assets/images/icon.png",
                    scale: 0.5,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(width: 8),
              Text("ChaoJobs",
                  style: GoogleFonts.lobster(fontSize: 25, color: Colors.blue))
            ],
          );
  }

  static platformDownloadButton(String asset, Screen type) {
    return GestureDetector(
      child: type == Screen.SMALL
          ? SizedBox(
              width: 75,
              height: 22.5,
              child: Image.asset(
                asset,
                fit: BoxFit.cover,
                scale: 1.5,
              ))
          : type == Screen.MEDIUM
              ? SizedBox(
                  width: 100,
                  height: 30,
                  child: Image.asset(
                    asset,
                    fit: BoxFit.cover,
                    scale: 1.5,
                  ))
              : SizedBox(
                  width: 200,
                  height: 60,
                  child: Image.asset(
                    asset,
                    fit: BoxFit.cover,
                    scale: 1.5,
                  )),
      onTap: () async {
        await _launchUrl(url[asset]!);
      },
    );
  }

  static Future<void> _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      final bool nativeAppLaunchSucceeded = await launchUrl(
        url,
      );
      // if (!nativeAppLaunchSucceeded) {
      //   await launch(url);
      // }
    }
  }

  static downloadButton() {
    return GestureDetector(
        child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 5, 10, 48),
                  borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8, bottom: 8),
                child: Text(
                  'download'.tr,
                  style: GoogleFonts.lobster(
                    fontSize: 16,
                    color: Colors.blue.shade300,
                  ),
                ),
              ),
            )),
        onTap: () async {
          try {
            if (Platform.isAndroid) {
              await _launchUrl(url['assets/images/getandroid.png']!);
            } else if (Platform.isIOS) {
              await _launchUrl(url['assets/images/getiphone.png']!);
            }
          } catch (_) {
            await _launchUrl(url['assets/images/getandroid.png']!);
            await _launchUrl(url['assets/images/getiphone.png']!);
          }
        });
  }

  static stepsText(String text, BuildContext context, Screen type) {
    if (type == Screen.LARGE) {
      return Padding(
          padding: const EdgeInsets.only(left: 52, right: 16, bottom: 16),
          child: Container(
              // width: MediaQuery.of(context).size.width * 0.3,
              child: Text('\u2022 $text',
                  style:
                      GoogleFonts.kanit(color: Colors.white, fontSize: 30))));
    } else if (type == Screen.MEDIUM) {
      return Padding(
          padding: const EdgeInsets.only(left: 52, right: 16, bottom: 16),
          child: Container(
              // width: MediaQuery.of(context).size.width * 0.3,
              child: Text('\u2022 $text',
                  style:
                      GoogleFonts.kanit(color: Colors.white, fontSize: 25))));
    } else {
      return Padding(
          padding: const EdgeInsets.only(left: 52, right: 52, bottom: 16),
          child: Container(
              // width: MediaQuery.of(context).size.width * 0.3,
              child: Text(text,
                  style:
                      GoogleFonts.kanit(color: Colors.white, fontSize: 11))));
    }
  }

  static titles(String title, BuildContext context, Screen type) {
    if (type == Screen.LARGE) {
      return Padding(
          padding:
              const EdgeInsets.only(left: 48, right: 16, top: 100, bottom: 16),
          child: Container(
            // width: MediaQuery.of(context).size.width * 0.3,
            child: Text(title,
                style: GoogleFonts.lobster(color: Colors.blue, fontSize: 35)),
          ));
    } else if (type == Screen.MEDIUM) {
      return Padding(
          padding:
              const EdgeInsets.only(left: 48, right: 16, top: 100, bottom: 16),
          child: Container(
            // width: MediaQuery.of(context).size.width * 0.3,
            child: Text(title,
                style: GoogleFonts.lobster(color: Colors.blue, fontSize: 30)),
          ));
    } else {
      return Padding(
          padding: EdgeInsets.only(
              left: 48,
              right: 48,
              top: 'features'.tr == title ? 16 : 100,
              bottom: 16),
          child: Container(
            // width: MediaQuery.of(context).size.width * 0.3,
            child: Text(title,
                style: GoogleFonts.lobster(color: Colors.blue, fontSize: 15)),
          ));
    }
  }
}
