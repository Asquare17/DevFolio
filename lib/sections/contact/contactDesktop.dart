import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/helper/database.dart';
import 'package:folio/helper/regex.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/contactMeCard.dart';
import 'package:folio/widget/customBtn.dart';
import 'package:folio/widget/customTextHeading.dart';
import 'package:folio/widget/socialMediaIcon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDesktop extends StatefulWidget {
  @override
  _ContactDesktopState createState() => _ContactDesktopState();
}

class _ContactDesktopState extends State<ContactDesktop> {
  final _msgController = TextEditingController();
  final _subjectController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _msgController.dispose();
    _subjectController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: _themeProvider.lightTheme ? kLightBackground : kDarkBackground,
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.06, vertical: height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSectionHeading(text: "Get in Touch"),
          // CustomSectionSubHeading(text: "Let's build something together"),
          TyperAnimatedTextKit(
              isRepeatingAnimation: true,
              speed: Duration(milliseconds: 50),
              textStyle: GoogleFonts.montserrat(
                fontSize: MediaQuery.of(context).size.height * 0.04,
                fontWeight: FontWeight.w400,
                color: _themeProvider.lightTheme ? Colors.black : Colors.white,
              ),
              text: [
                "Let's work together!",
                "To build something great!",
                "Something, that matters!"
              ]),
          const SizedBox(height: 50.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 50.0,
                      right: 50.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: width * 0.19,
                              child: TextFormField(
                                cursorColor: _themeProvider.lightTheme
                                    ? kPrimaryLightColor
                                    : kPrimaryColor,
                                controller: _nameController,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.words,
                                maxLines: 1,
                                style: TextStyle(
                                    color: _themeProvider.lightTheme
                                        ? Colors.black
                                        : Colors.white),
                                decoration: InputDecoration(
                                  filled: true,
                                  labelText: "Name",
                                  labelStyle: TextStyle(
                                      color: _themeProvider.lightTheme
                                          ? Colors.black
                                          : Colors.white),
                                  fillColor: _themeProvider.lightTheme
                                      ? Colors.grey[200]
                                      : Colors.grey[700],
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: _themeProvider.lightTheme
                                            ? kPrimaryLightColor
                                            : kPrimaryColor,
                                        width: 2),
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            SizedBox(
                              width: width * 0.19,
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                cursorColor: _themeProvider.lightTheme
                                    ? kPrimaryLightColor
                                    : kPrimaryColor,
                                validator: emailVal,
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                style: TextStyle(
                                    color: _themeProvider.lightTheme
                                        ? Colors.black
                                        : Colors.white),
                                decoration: InputDecoration(
                                  filled: true,
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                      color: _themeProvider.lightTheme
                                          ? Colors.black
                                          : Colors.white),
                                  fillColor: _themeProvider.lightTheme
                                      ? Colors.grey[200]
                                      : Colors.grey[700],
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: _themeProvider.lightTheme
                                            ? kPrimaryLightColor
                                            : kPrimaryColor,
                                        width: 2),
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15.0),
                        SizedBox(
                          width: width * 0.4,
                          child: TextFormField(
                            cursorColor: _themeProvider.lightTheme
                                ? kPrimaryLightColor
                                : kPrimaryColor,
                            controller: _subjectController,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            maxLines: 1,
                            style: TextStyle(
                                color: _themeProvider.lightTheme
                                    ? Colors.black
                                    : Colors.white),
                            decoration: InputDecoration(
                              filled: true,
                              labelText: "Subject",
                              labelStyle: TextStyle(
                                  color: _themeProvider.lightTheme
                                      ? Colors.black
                                      : Colors.white),
                              fillColor: _themeProvider.lightTheme
                                  ? Colors.grey[200]
                                  : Colors.grey[700],
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: _themeProvider.lightTheme
                                        ? kPrimaryLightColor
                                        : kPrimaryColor,
                                    width: 2),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        SizedBox(
                          width: width * 0.4,
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: _themeProvider.lightTheme
                                ? kPrimaryLightColor
                                : kPrimaryColor,
                            validator: emptyVal,
                            controller: _msgController,
                            keyboardType: TextInputType.multiline,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.done,
                            maxLines: 7,
                            style: TextStyle(
                                color: _themeProvider.lightTheme
                                    ? Colors.black
                                    : Colors.white),
                            decoration: InputDecoration(
                              filled: true,
                              labelText: "Message",
                              labelStyle: TextStyle(
                                  color: _themeProvider.lightTheme
                                      ? Colors.black
                                      : Colors.white),
                              fillColor: _themeProvider.lightTheme
                                  ? Colors.grey[200]
                                  : Colors.grey[700],
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: _themeProvider.lightTheme
                                        ? kPrimaryLightColor
                                        : kPrimaryColor,
                                    width: 2),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50.0),
                        SizedBox(
                          height: 40.0,
                          width: 200,
                          child: OutlinedCustomBtn(
                            btnText: "Send message",
                            onPressed: () async {
                              String result = await DatabaseService()
                                  .sendMessage(
                                      _msgController.text,
                                      _emailController.text,
                                      _subjectController.text,
                                      _nameController.text,
                                      DateTime.now());
                              bool success = "Message sent" == result;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  padding: EdgeInsets.all(8),
                                  elevation: 3,
                                  content: Text(result),
                                  backgroundColor:
                                      success ? Colors.green : Colors.red,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 25.0,
              ),
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      kContactIcons.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: ContactCard(
                          onTap: index == 2
                              ? null
                              : () {
                                  launch(kContactFunction[index]);
                                },
                          cardWidth: width < 1200 ? width * 0.25 : width * 0.2,
                          cardHeight:
                              width < 1200 ? height * 0.28 : height * 0.25,
                          projectIconData: kContactIcons[index],
                          projectTitle: kContactTitles[index],
                          projectDescription: kContactDetails[index],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      kSocialIcons.length,
                      (index) => SocialMediaIconBtn(
                        icon: kSocialIcons[index],
                        socialLink: kSocialLinks[index],
                        height: MediaQuery.of(context).size.height * 0.035,
                        horizontalPadding:
                            MediaQuery.of(context).size.width * 0.005,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
