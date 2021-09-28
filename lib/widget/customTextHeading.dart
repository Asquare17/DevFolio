import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomSectionHeading extends StatelessWidget {
  final String text;

  const CustomSectionHeading({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.remove,
          color: _themeProvider.lightTheme ? kPrimaryLightColor : kPrimaryColor,
        ),
        AdaptiveText(
          text.toUpperCase(),
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            letterSpacing: 1.0,
            color:
                _themeProvider.lightTheme ? kPrimaryLightColor : kPrimaryColor,
          ),
        ),
        Icon(
          Icons.remove,
          color: _themeProvider.lightTheme ? kPrimaryLightColor : kPrimaryColor,
        ),
      ],
    );
  }
}

class CustomSectionSubHeading extends StatelessWidget {
  final String text;
  final double fontSize;

  const CustomSectionSubHeading({Key key, @required this.text, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return AdaptiveText(
      text,
      style: GoogleFonts.montserrat(
        fontSize: fontSize ?? MediaQuery.of(context).size.height * 0.04,
        fontWeight: FontWeight.w400,
        color: _themeProvider.lightTheme ? Colors.black : Colors.white,
      ),
    );
  }
}
