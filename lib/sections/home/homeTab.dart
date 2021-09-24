import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/socialMediaIcon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, width * 0.1, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: Image.asset(
                        "assets/hi.gif",
                        height: height * 0.05,
                      ),
                    ),
                    Text(
                      "  Hi, I'm",
                      style: GoogleFonts.montserrat(
                        fontSize: height * 0.03,
                        fontWeight: FontWeight.w300,
                        color: _themeProvider.lightTheme
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Text(
                  "Abdulwahab",
                  style: GoogleFonts.montserrat(
                    fontSize: width * 0.07,
                    fontWeight: FontWeight.w500,
                    color:
                        _themeProvider.lightTheme ? Colors.black : Colors.white,
                  ),
                ),
                Text(
                  " Abdulrasaq",
                  style: GoogleFonts.montserrat(
                    fontSize: width * 0.07,
                    fontWeight: FontWeight.w500,
                    color:
                        _themeProvider.lightTheme ? Colors.black : Colors.white,
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.smartphone,
                      color: kPrimaryColor,
                    ),
                    TyperAnimatedTextKit(
                        isRepeatingAnimation: true,
                        speed: Duration(milliseconds: 50),
                        textStyle: GoogleFonts.montserrat(
                          fontSize: height * 0.03,
                          fontWeight: FontWeight.w200,
                          color: _themeProvider.lightTheme
                              ? Colors.black
                              : Colors.white,
                        ),
                        text: [
                          " Mobile Developer",
                        ]),
                  ],
                ),
                SizedBox(
                  height: height * 0.045,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < kSocialIcons.length; i++)
                      SocialMediaIconBtn(
                        icon: kSocialIcons[i],
                        socialLink: kSocialLinks[i],
                        height: height * 0.035,
                        horizontalPadding: width * 0.015,
                      )
                  ],
                )
              ],
            ),
          ),
          Center(
            child: CircleAvatar(
              radius: (width / height) < 1.3 ? width * 0.15 : height * 0.15,
              backgroundColor: Colors.black,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    (width / height) < 1.3 ? width * 0.15 : height * 0.15),
                child: Image.asset(
                  'assets/1.png',
                  height: (width / height) < 1.3 ? width * 0.3 : height * 0.3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
