import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: height * 0.2),
      padding: const EdgeInsets.all(8.0),
      color: Colors.grey[900],
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            height: height * 0.07,
            width: width,
            child: Center(
              child: AdaptiveText(
                "© ${DateTime.now().year}  by Abdulwahab Abdulrasaq",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w300,
                  color: Colors
                      .white, // _themeProvider.lightTheme ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
          Container(
            height: height * 0.07,
            width: width,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AdaptiveText(
                    "Developed in 💙 with ",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w300,
                      color: Colors
                          .white, //  _themeProvider.lightTheme ? Colors.black : Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () =>
                        launchURL("https://github.com/mhmzdev/DevFolio"),
                    child: Text(
                      "Flutter",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
