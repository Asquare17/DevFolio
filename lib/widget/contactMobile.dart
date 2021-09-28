import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCardMobile extends StatefulWidget {
  final IconData projectIconData;
  final String projectTitle;
  final String projectDescription;
  final double cardWidth;
  final double cardHeight;
  final Function onTap;
  final double verticalPadding, horizontalPadding, borderRadius;
  const ContactCardMobile(
      {Key key,
      this.projectTitle,
      this.onTap,
      this.projectDescription,
      this.projectIconData,
      this.cardWidth,
      this.borderRadius,
      this.horizontalPadding,
      this.verticalPadding,
      this.cardHeight})
      : super(key: key);
  @override
  _ContactCardMobileState createState() => _ContactCardMobileState();
}

class _ContactCardMobileState extends State<ContactCardMobile> {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MaterialButton(
      color: _themeProvider.lightTheme ? Colors.white : darKLightNavy,
      elevation: 5.0,
      hoverColor:
          _themeProvider.lightTheme ? kPrimaryLightColor : kPrimaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          side: BorderSide(
            color:
                _themeProvider.lightTheme ? kPrimaryLightColor : kPrimaryColor,
          )),
      onPressed: widget.onTap,
      child: Container(
        width: widget.cardWidth,
        // height: widget.cardHeight,
        padding: EdgeInsets.symmetric(
            vertical: widget.verticalPadding,
            horizontal: widget.horizontalPadding),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(widget.projectIconData,
                color: _themeProvider.lightTheme ? Colors.black : Colors.white),
            AdaptiveText(
              widget.projectDescription,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  fontSize: height * 0.015,
                  letterSpacing: 2.0,
                  color:
                      _themeProvider.lightTheme ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w400,
                  height: width >= 600 ? 2.0 : 1.2),
            ),
          ],
        ),
      ),
    );
  }
}
