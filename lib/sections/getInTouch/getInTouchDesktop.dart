import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:folio/animations/bottomAnimation.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:folio/widget/customBtn.dart';
import 'package:folio/widget/footer.dart';
import 'package:folio/widget/socialMediaIcon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class GetInTouchDesktop extends StatefulWidget {
  @override
  _GetInTouchDesktopState createState() => _GetInTouchDesktopState();
}

class _GetInTouchDesktopState extends State<GetInTouchDesktop> {
  final _msgController = TextEditingController();
  final _subjectController = TextEditingController();

  @override
  void dispose() {
    _msgController.dispose();
    super.dispose();
  }

  launchMailTo() async {
    final mailToLink = Mailto(
      to: ["asquare.shola@gmail.com"],
      subject:
          _subjectController.text.isEmpty ? "Project" : _subjectController.text,
      body: _msgController.text.isEmpty ? "Hi, Abdul" : _msgController.text,
    );

    // final mailUrl = "mailto:$mailToLink";
    try {
      await launch("$mailToLink");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Material(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 35.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.play_arrow_rounded,
                    color: _themeProvider.lightTheme
                        ? kPrimaryLightColor
                        : kPrimaryColor,
                    size: 40.0,
                  ),
                  TyperAnimatedTextKit(
                      isRepeatingAnimation: true,
                      speed: Duration(milliseconds: 50),
                      textStyle: GoogleFonts.montserrat(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w200,
                        color: _themeProvider.lightTheme
                            ? Colors.black
                            : Colors.white,
                      ),
                      text: [
                        " Let's work together!",
                        " To build something great!",
                        " Something, that matters!"
                      ]),
                ],
              ),
              const SizedBox(height: 30.0),
              AdaptiveText(
                "Message:",
                style: GoogleFonts.montserrat(
                  color:
                      _themeProvider.lightTheme ? Colors.black : Colors.white,
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(height: 15.0),
              SizedBox(
                width: width * 0.4,
                child: TextField(
                  controller: _msgController,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  maxLines: 7,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: _themeProvider.lightTheme
                        ? Colors.grey[200]
                        : Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
              SizedBox(
                height: 40.0,
                width: 200,
                child: OutlinedCustomBtn(
                  btnText: "Send",
                  onPressed: () {
                    launchURL(
                        "mailto:hamza.6.shakeel@gmail.com?subject=SOMESUBJECT&body=SOMEMSG");
                  },
                ),
              ),
              const SizedBox(height: 50.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  kSocialIcons.length,
                  (index) => WidgetAnimator(
                    child: SocialMediaIconBtn(
                      icon: kSocialIcons[index],
                      socialLink: kSocialLinks[index],
                      height: MediaQuery.of(context).size.height * 0.035,
                      horizontalPadding:
                          MediaQuery.of(context).size.width * 0.005,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
