import 'package:flutter/foundation.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/customBtn.dart';
import 'package:folio/widget/customTextHeading.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/widget/aboutMeMetaData.dart';
import 'package:folio/widget/communityIconBtn.dart';
import 'package:folio/widget/toolsTechWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.06,
      ),
      color: _themeProvider.lightTheme ? kLightBackground : kDarkBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSectionHeading(text: "About Me"),
          CustomSectionSubHeading(text: "Get to know me "),
          SizedBox(
            height: height * 0.03,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/web.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color:
                      _themeProvider.lightTheme ? Colors.white : Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "I'm Muhammad Hamza, a Flutter developer, Technical blog writer and UI designer.",
                        style: GoogleFonts.montserrat(
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.w400,
                          color: _themeProvider.lightTheme
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        "3+ years of experience in Mobile applocation development using Flutter, Kotlin and Swift. I have worked on several mobile solutions ranging from a cross-platform delivery app, store management app to a state's radio app and beyond. In my free time, I play Football (Soccer) and Chess.",
                        style: GoogleFonts.montserrat(
                          fontSize: height * 0.025,
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Technologies I have worked with:",
                          style: GoogleFonts.montserrat(
                              color: _themeProvider.lightTheme
                                  ? kPrimaryLightColor
                                  : kPrimaryColor,
                              fontSize: height * 0.018),
                        ),
                      ),
                      Row(
                        children: [
                          for (int i = 0; i < 2; i++)
                            SizedBox(
                              width: width * 0.15,
                              child: ToolTechWidget(
                                techName: kTools[i],
                              ),
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          for (int i = 2; i < 4; i++)
                            SizedBox(
                              width: width * 0.15,
                              child: ToolTechWidget(
                                techName: kTools[i],
                              ),
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          for (int i = 4; i < 6; i++)
                            SizedBox(
                              width: width * 0.15,
                              child: ToolTechWidget(
                                techName: kTools[i],
                              ),
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          for (int i = 6; i < 8; i++)
                            SizedBox(
                              width: width * 0.15,
                              child: ToolTechWidget(
                                techName: kTools[i],
                              ),
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
                        btnText: "Resume",
                        onPressed: () {
                          kIsWeb
                              ? html.window.open(
                                  'https://drive.google.com/uc?export=view&id=1OOdcdGEN3thVvpZ4cl_MM0LT-GCMuLIE',
                                  "pdf")
                              : launchURL(
                                  'https://drive.google.com/uc?export=view&id=1OOdcdGEN3thVvpZ4cl_MM0LT-GCMuLIE');
                        }),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
