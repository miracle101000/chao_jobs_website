import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../functions.dart';

class SmallScreen extends StatelessWidget {
  final Screen type;
  const SmallScreen({Key? key, required this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: Functions.appBar(type),
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
                height: height * 0.6,
                child: Stack(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Get.locale!.languageCode == 'ar'
                            ? Colors.blue
                            : null,
                        height: height,
                        width: Get.locale!.languageCode == 'ar'
                            ? MediaQuery.of(context).size.width * 0.34
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
                            ? null
                            : MediaQuery.of(context).size.width * 0.34,
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
                      left: width == 1024 ? width * 0.48 : width * 0.40,
                      child: SizedBox(
                          height: height * 0.4,
                          width: 350,
                          child: Material(
                            type: MaterialType.transparency,
                            child: Image.asset("assets/images/iphone.png"),
                          ))),
                  Positioned(
                      left: Get.locale!.languageCode == 'ar'
                          ? null
                          : width * 0.045,
                      right: Get.locale!.languageCode == 'ar' && width < 300
                          ? width * 0.40
                          : Get.locale!.languageCode == 'ar' && width >= 300
                              ? width * 0.5
                              : null,
                      top: height * 0.20,
                      child: SizedBox(
                        width: width * 0.6,
                        child: Text(
                          'advertise'.tr,
                          style: GoogleFonts.lobster(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                      )),
                  Positioned(
                      left: width * 0.05,
                      top: Get.locale!.languageCode == 'ar'
                          ? height * 0.27
                          : height * 0.25,
                      child: SizedBox(
                          width: width * 0.4,
                          child: Text(
                            'promote'.tr,
                            style: GoogleFonts.kanit(
                              fontSize: 11,
                              // fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ))),
                  Positioned(
                    left:
                        Get.locale!.languageCode == 'ar' ? null : width * 0.05,
                    right: Get.locale!.languageCode == 'ar' && width < 300
                        ? width * 0.40
                        : Get.locale!.languageCode == 'ar' && width >= 300
                            ? width * 0.5
                            : null,
                    top: width == 1024 ? height * 0.5 : height * 0.35,
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
                ])),
            Container(
              // height: width == 1024 ? height + 186 : height,
              width: width,
              padding: const EdgeInsets.only(bottom: 48),
              color: const Color.fromARGB(255, 5, 10, 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    // width: width * 0.85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Functions.titles("become_active".tr, context, type),
                        Functions.stepsText("create_account".tr, context, type),
                        Functions.stepsText("set_profile".tr, context, type),
                        Functions.stepsText("set_prices".tr, context, type),
                        Functions.stepsText("post_pic".tr, context, type),
                        Functions.stepsText("like".tr, context, type),
                        Functions.stepsText("post_job".tr, context, type),
                        Functions.stepsText("review".tr, context, type),
                        Functions.stepsText("chat".tr, context, type),
                        Functions.titles("features".tr, context, type),
                        Functions.stepsText("app_inc".tr, context, type),
                        Functions.stepsText("app_lan".tr, context, type),
                      ],
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 8,
                  ),

                  SizedBox(
                    height: 170,
                    child: ListView.builder(
                        itemCount: Functions.lang.length,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(Functions.lang[index].tr,
                                      style: GoogleFonts.kanit(
                                        color: Functions.hook[
                                                    Get.locale!.languageCode] ==
                                                Functions.lang[index]
                                            ? Colors.white
                                            : Colors.grey,
                                      ))
                                ],
                              ),
                            ),
                            onTap: () async {
                              await Get.updateLocale(Locale(
                                  Functions.rhook[Functions.lang[index]]!,
                                  Functions.lang[index] == 'arabic'
                                      ? 'LY'
                                      : Functions.lang[index] == 'french'
                                          ? 'FR'
                                          : Functions.lang[index] ==
                                                  'portuguese'
                                              ? "PT"
                                              : "CA"));
                            },
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '101 Inc.\u00A9',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
              // child: Image.asset(
              //   "assets/images/pattern.png",
              //   repeat: ImageRepeat.repeat,
              // ),
            )
          ]),
        ));
  }
}
