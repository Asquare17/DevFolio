import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/contactMeCard.dart';
import 'package:folio/widget/contactMobile.dart';
import 'package:folio/widget/customBtn.dart';
import 'package:folio/widget/customTextHeading.dart';
import 'package:folio/widget/projectCard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMobileTab extends StatefulWidget {
  @override
  _ContactMobileTabState createState() => _ContactMobileTabState();
}

class _ContactMobileTabState extends State<ContactMobileTab> {
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
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.06, vertical: height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSectionHeading(text: "Get in Touch"),

          //CustomSectionSubHeading(text: "Let's build something together \n\n"),
          TyperAnimatedTextKit(
              isRepeatingAnimation: true,
              speed: Duration(milliseconds: 50),
              textStyle: GoogleFonts.montserrat(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.w400,
                color: _themeProvider.lightTheme ? Colors.black : Colors.white,
              ),
              text: [
                "Let's work together!",
                "To build something great!",
                "Something, that matters!"
              ]),
          const SizedBox(height: 20.0),
          Center(
            child: SizedBox(
              width: width < 500 ? width * 0.88 : width * 0.68,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 3,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ContactCardMobile(
                    borderRadius: 30,
                    horizontalPadding: 0,
                    verticalPadding: width < 500 ? 5 : 10,
                    cardWidth: width < 300
                        ? width * 0.6
                        : width < 400
                            ? width * 0.5
                            : width < 500
                                ? width * 0.4
                                : width * 0.2,
                    onTap: index == 2
                        ? null
                        : () {
                            launch(kContactFunction[index]);
                          },
                    projectIconData: kContactIcons[index],
                    projectTitle: kContactTitles[index],
                    projectDescription: kContactDetails[index],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Center(
            child: Material(
              color: Colors.transparent,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width < 500 ? width * 0.42 : width * 0.33,
                          child: TextField(
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            maxLines: 1,
                            style: TextStyle(
                                color: _themeProvider.lightTheme
                                    ? Colors.black
                                    : Colors.white),
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "Name",
                              hintStyle: TextStyle(
                                  color: _themeProvider.lightTheme
                                      ? Colors.black
                                      : Colors.white),
                              fillColor: _themeProvider.lightTheme
                                  ? Colors.grey[200]
                                  : Colors.grey[700],
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width < 500 ? width * 0.04 : width * 0.02,
                        ),
                        SizedBox(
                          width: width < 500 ? width * 0.42 : width * 0.33,
                          child: TextField(
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
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  color: _themeProvider.lightTheme
                                      ? Colors.black
                                      : Colors.white),
                              fillColor: _themeProvider.lightTheme
                                  ? Colors.grey[200]
                                  : Colors.grey[700],
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: width < 500 ? 10 : 15.0),
                    SizedBox(
                      width: width < 500 ? width * 0.88 : width * 0.68,
                      child: TextField(
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
                          hintText: "Subject",
                          hintStyle: TextStyle(
                              color: _themeProvider.lightTheme
                                  ? Colors.black
                                  : Colors.white),
                          fillColor: _themeProvider.lightTheme
                              ? Colors.grey[200]
                              : Colors.grey[700],
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: width < 500 ? 10 : 15.0),
                    SizedBox(
                      width: width < 500 ? width * 0.88 : width * 0.68,
                      child: TextField(
                        controller: _msgController,
                        keyboardType: TextInputType.multiline,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.done,
                        maxLines: width < 500 ? 4 : 7,
                        style: TextStyle(
                            color: _themeProvider.lightTheme
                                ? Colors.black
                                : Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          hintText: "Message",
                          hintStyle: TextStyle(
                              color: _themeProvider.lightTheme
                                  ? Colors.black
                                  : Colors.white),
                          fillColor: _themeProvider.lightTheme
                              ? Colors.grey[200]
                              : Colors.grey[700],
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
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
                    const SizedBox(height: 25.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
