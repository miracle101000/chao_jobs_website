import 'package:chao_jobs_website/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LargeScreen extends StatelessWidget {
  final Screen type;
  const LargeScreen({Key? key, required this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: Functions.appBar(),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: Get.locale!.languageCode == 'ar'
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  Row(
                    children: [
                      Container(
                        height: height,
                        width: Get.locale!.languageCode == 'ar'
                            ? width * 0.35
                            : width * 0.65,
                        color: Get.locale!.languageCode == 'ar'
                            ? Colors.blue
                            : null,
                        child: Get.locale!.languageCode == 'ar'
                            ? Image.asset(
                                "assets/images/pattern.png",
                                repeat: ImageRepeat.repeatY,
                              )
                            : null,
                        // color: Colors.blue.shade300,
                      ),
                      Container(
                        // color: const Color.fromARGB(255, 5, 10, 48),
                        color: Get.locale!.languageCode == 'ar'
                            ? null
                            : Colors.blue,
                        height: height,
                        width: Get.locale!.languageCode == 'ar'
                            ? width * 0.65
                            : width * 0.35,
                        child: Get.locale!.languageCode == 'ar'
                            ? null
                            : Image.asset(
                                "assets/images/pattern.png",
                                repeat: ImageRepeat.repeatY,
                              ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: height * 0.134,
                      left: Get.locale!.languageCode == 'ar'
                          ? null
                          : width * 0.53,
                      right: Get.locale!.languageCode == 'ar'
                          ? width * 0.25
                          : null,
                      child: SizedBox(
                          height: height * 0.8,
                          width: 350,
                          child: Material(
                            type: MaterialType.transparency,
                            child: Image.asset("assets/images/iphone.png"),
                          ))),
                  Positioned(
                      left: Get.locale!.languageCode == 'ar'
                          ? null
                          : width * 0.10,
                      right: Get.locale!.languageCode == 'ar'
                          ? width * 0.60
                          : null,
                      top: height * 0.35,
                      child: SizedBox(
                          width: width * 0.4,
                          child: Text(
                            'advertise'.tr,
                            style: GoogleFonts.lobster(
                              fontSize: 50,
                              color: Colors.blue,
                            ),
                          ))),
                  Positioned(
                      top: height * 0.6,
                      left: Get.locale!.languageCode == 'ar'
                          ? null
                          : width * 0.10,
                      right:
                          Get.locale!.languageCode == 'ar' ? width * 0.6 : null,
                      child: SizedBox(
                        width: width * 0.4,
                        child: Text(
                          'promote'.tr,
                          style: GoogleFonts.kanit(
                              fontSize: 25, color: Colors.grey),
                        ),
                      )),
                  Positioned(
                    left:
                        Get.locale!.languageCode == 'ar' ? null : width * 0.10,
                    right:
                        Get.locale!.languageCode == 'ar' ? width * 0.60 : null,
                    top: height * 0.85,
                    child: Row(
                      children: [
                        Functions.platformDownloadButton(
                            'assets/images/getphone.png', type),
                        const SizedBox(
                          width: 16,
                        ),
                        Functions.platformDownloadButton(
                            'assets/images/getandroid.png', type)
                      ],
                    ),
                  )
                ]),
                Container(
                  // height: height + 100,
                  width: width,
                  padding: const EdgeInsets.only(bottom: 48),
                  color: const Color.fromARGB(255, 5, 10, 48),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * 0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Functions.titles("become_active".tr, context, type),
                            Functions.stepsText(
                                "create_account".tr, context, type),
                            Functions.stepsText(
                                "set_profile".tr, context, type),
                            Functions.stepsText("set_prices".tr, context, type),
                            Functions.stepsText("post_pic".tr, context, type),
                            Functions.stepsText("like".tr, context, type),
                            Functions.stepsText("post_job".tr, context, type),
                            Functions.stepsText("review".tr, context, type),
                            Functions.stepsText("chat".tr, context, type),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      SizedBox(
                        width: width * 0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Functions.titles("features".tr, context, type),
                            Functions.stepsText("app_inc".tr, context, type),
                            Functions.stepsText("app_lan".tr, context, type),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // child: Image.asset(
                  //   "assets/images/pattern.png",
                  //   repeat: ImageRepeat.repeat,
                  // ),
                ),
                SizedBox(
                  height: 45,
                  child: ListView.builder(
                      itemCount: Functions.lang.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 8, right: 8, top: index != 0 ? 16 : 8),
                            child: index == 0
                                ? Row(
                                    children: [
                                      Text('101 Inc.\u00A9',
                                          style: GoogleFonts.kanit(
                                            color: Colors.grey,
                                          )),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Text(Functions.lang[index].tr,
                                          style: GoogleFonts.kanit(
                                            color: Functions.hook[Get.locale!
                                                        .languageCode] ==
                                                    Functions.lang[index]
                                                ? const Color.fromARGB(
                                                    255, 5, 10, 48)
                                                : Colors.grey,
                                          ))
                                    ],
                                  )
                                : Text(Functions.lang[index].tr,
                                    style: GoogleFonts.kanit(
                                      color: Functions.hook[
                                                  Get.locale!.languageCode] ==
                                              Functions.lang[index]
                                          ? const Color.fromARGB(255, 5, 10, 48)
                                          : Colors.grey,
                                    )),
                          ),
                          onTap: () async {
                            await Get.updateLocale(Locale(
                                Functions.rhook[Functions.lang[index]]!,
                                Functions.lang[index] == 'arabic'
                                    ? 'LY'
                                    : Functions.lang[index] == 'french'
                                        ? 'FR'
                                        : Functions.lang[index] == 'portuguese'
                                            ? "PT"
                                            : "CA"));
                          },
                        );
                      }),
                )
              ]),
        ));
  }
}
