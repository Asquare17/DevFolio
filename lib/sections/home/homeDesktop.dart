import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:folio/animations/bottomAnimation.dart';
import 'package:folio/animations/entranceFader.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:folio/widget/customBtn.dart';
import 'package:folio/widget/socialMediaIcon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class HomeDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height - 50,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    EntranceFader(
                      offset: Offset(0, 0),
                      delay: Duration(seconds: 2),
                      duration: Duration(milliseconds: 800),
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: Image.asset(
                          "assets/hi.gif",
                          height: height * 0.05,
                        ),
                      ),
                    ),
                    AdaptiveText(
                      "  Hi, my name is",
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
                AdaptiveText(
                  "Abdulwahab",
                  style: GoogleFonts.montserrat(
                      color: _themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                      fontSize: width < 1200 ? width * 0.035 : width * 0.04,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 5.0),
                ),
                AdaptiveText(
                  "Abdulrasaq",
                  style: GoogleFonts.montserrat(
                      color: _themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                      fontSize: width < 1200 ? width * 0.035 : width * 0.04,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 5.0),
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                EntranceFader(
                  offset: Offset(-10, 0),
                  delay: Duration(seconds: 1),
                  duration: Duration(milliseconds: 800),
                  child: Row(
                    children: [
                      Icon(
                        Icons.smartphone,
                        color: _themeProvider.lightTheme
                            ? kPrimaryLightColor
                            : kPrimaryColor,
                      ),
                      TyperAnimatedTextKit(
                          isRepeatingAnimation: true,
                          speed: Duration(milliseconds: 50),
                          textStyle: GoogleFonts.montserrat(
                            fontSize: width * 0.018,
                            fontWeight: FontWeight.w500,
                            color: _themeProvider.lightTheme
                                ? Colors.black
                                : Colors.white,
                          ),
                          text: [
                            " I'm a Mobile Developer",
                          ]),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                SizedBox(
                  width: width * 0.55,
                  child: Text(
                    "I build apps that follows the best practice to deliver over the top user experience. Open to building products that will eat the world.",
                    style: GoogleFonts.montserrat(
                      fontSize: width < 1300 ? width * 0.018 : width * 0.016,
                      fontWeight: FontWeight.w300,
                      color: _themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                SizedBox(
                  height: 40.0,
                  width: 200,
                  child: OutlinedCustomBtn(
                    btnText: "Send message",
                    onPressed: () {
                      launchURL(
                          "mailto:hamza.6.shakeel@gmail.com?subject=SOMESUBJECT&body=SOMEMSG");
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    kSocialIcons.length,
                    (index) => WidgetAnimator(
                      child: SocialMediaIconBtn(
                        icon: kSocialIcons[index],
                        socialLink: kSocialLinks[index],
                        height: height * 0.035,
                        horizontalPadding: index == 1 ? width * 0.01 : 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: (width / height) < 1.3 ? width * 0.15 : height * 0.2,
            backgroundColor: Color(0xFF111111),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  (width / height) < 1.3 ? width * 0.15 : height * 0.2),
              child: Image.asset(
                'assets/1.png',
                height: (width / height) < 1.3 ? width * 0.3 : height * 0.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
