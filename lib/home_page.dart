import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            toolbarHeight: 75,
            backgroundColor: Colors.transparent,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(
                                left: 16, top: 16, right: 4, bottom: 16),
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 4, top: 16, bottom: 16),
                            child: Text(
                              "ChaoJobs",
                              style: GoogleFonts.lobster(fontSize: 25),
                            ))
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 32),
                        child: Container(
                          child: Padding(
                            child: Text(
                              'Download',
                              style: GoogleFonts.lobster(fontSize: 16),
                            ),
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blue.shade300,
                              borderRadius: BorderRadius.circular(25)),
                        ))
                  ]),
            )),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(children: [
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.65,
                    color: Colors.blue.shade300,
                  ),
                  Container(
                    color: Colors.black,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.35,
                  ),
                ],
              ),
              Image.asset("assets/images/iphone.png")
            ]),
            Container(
              height: MediaQuery.of(context).size.height,
            )
          ]),
        ));
  }
}
