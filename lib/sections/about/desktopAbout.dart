import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/aboutMeMetaData.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:folio/widget/communityIconBtn.dart';
import 'package:folio/widget/customBtn.dart';
import 'package:folio/widget/customTextHeading.dart';
import 'package:folio/widget/toolsTechWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:universal_html/html.dart' as html;

class AboutDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      color: _themeProvider.lightTheme ? kLightBackground : kDarkBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSectionHeading(text: "About Me"),
          CustomSectionSubHeading(
            text: "Get to know me ",
            fontSize: width < 1230 ? width * 0.02 : null,
          ),
          SizedBox(height: 30.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/web.png',
                  fit: width < 1230 ? BoxFit.fitWidth : BoxFit.cover,
                  height: width < 1230 ? null : height * 0.5,
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Expanded(
                flex: width < 1230 ? 2 : 1,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AdaptiveText(
                        "I'm Muhammad Hamza, a Flutter developer, Technical blog writer and UI designer.",
                        style: GoogleFonts.montserrat(
                          fontSize: width < 1230 ? width * 0.02 : width * 0.015,
                          fontWeight: FontWeight.w400,
                          color: _themeProvider.lightTheme
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      AdaptiveText(
                        "3+ years of experience in Mobile applocation development using Flutter, Kotlin and Swift. I have worked on several mobile solutions ranging from a cross-platform delivery app, store management app to a state's radio app and beyond. In my free time, I play Football (Soccer) and Chess.",
                        style: GoogleFonts.montserrat(
                          fontSize: width < 1230 ? width * 0.02 : width * 0.015,
                          fontWeight: FontWeight.w400,
                          color: _themeProvider.lightTheme
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.025,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(color: Colors.grey[900], width: 2.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      AdaptiveText(
                        "Technologies I have worked with:",
                        style: GoogleFonts.montserrat(
                          fontSize: width < 1230 ? width * 0.02 : width * 0.015,
                          color: _themeProvider.lightTheme
                              ? kPrimaryLightColor
                              : kPrimaryColor,
                        ),
                      ),
                      Row(
                        children: [
                          for (int i = 0; i < 4; i++)
                            ToolTechWidget(
                              fontSize:
                                  width < 1230 ? width * 0.02 : width * 0.015,
                              techName: kTools[i],
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          for (int i = 4; i < 8; i++)
                            ToolTechWidget(
                              fontSize:
                                  width < 1230 ? width * 0.02 : width * 0.015,
                              techName: kTools[i],
                            ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(color: Colors.grey[900], width: 2.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: width < 1230 ? width * 0.05 : width * 0.1,
              ),
            ],
          ),
          SizedBox(
            height: height * 0.025,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 40.0,
                    width: 150,
                    child: OutlinedCustomBtn(
                      onPressed: () {
                        html.window.open(
                            'https://drive.google.com/file/d/1GF-wtbu2ob_Uxhw2In2QA8QiYi3XjCj1/view?usp=sharing',
                            "pdf");
                      },
                      btnText: "Resume",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
