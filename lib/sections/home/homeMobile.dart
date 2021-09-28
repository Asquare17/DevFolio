import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/customBtn.dart';
import 'package:folio/widget/socialMediaIcon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class HomeMobile extends StatefulWidget {
  @override
  _HomeMobileState createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: height * 0.05),
            child: Center(
              child: CircleAvatar(
                radius: height * 0.15,
                backgroundColor: Colors.black,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(height * 0.15),
                  child: Image.asset(
                    'assets/1.png',
                    height: width < 700 ? height * 0.3 : height * 0.3,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: height * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: Image.asset(
                        "assets/hi.gif",
                        height: height * 0.03,
                      ),
                    ),
                    Text(
                      "  Hi, my name is",
                      style: GoogleFonts.montserrat(
                          fontSize: height * 0.025,
                          color: _themeProvider.lightTheme
                              ? Colors.black
                              : Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Abdulwahab ",
                      style: GoogleFonts.montserrat(
                          color: _themeProvider.lightTheme
                              ? Colors.black
                              : Colors.white,
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Abdulrasaq",
                      style: GoogleFonts.montserrat(
                          color: _themeProvider.lightTheme
                              ? Colors.black
                              : Colors.white,
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                            fontSize: height * 0.03,
                            color: _themeProvider.lightTheme
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.w500),
                        text: [
                          "Mobile Developer",
                        ]),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "I build apps that follows the best practice to deliver over the top user experience. Open to building products that will eat the world.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontSize: height * 0.02,
                        color: _themeProvider.lightTheme
                            ? Colors.black
                            : Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: height * 0.035,
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
                  height: height * 0.035,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < kSocialIcons.length; i++)
                      SocialMediaIconBtn(
                        icon: kSocialIcons[i],
                        socialLink: kSocialLinks[i],
                        height: height * 0.03,
                        horizontalPadding: 10.0,
                      )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
