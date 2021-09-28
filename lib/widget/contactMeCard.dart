import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCard extends StatefulWidget {
  final IconData projectIconData;
  final String projectTitle;
  final String projectDescription;
  final double cardWidth;
  final double cardHeight;
  final Function onTap;
  const ContactCard(
      {Key key,
      this.projectTitle,
      this.onTap,
      this.projectDescription,
      this.projectIconData,
      this.cardWidth,
      this.cardHeight})
      : super(key: key);
  @override
  _ContactCardState createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.onTap,
      onHover: (isHovering) {
        if (isHovering) {
          setState(() {
            isHover = true;
          });
        } else {
          setState(() {
            isHover = false;
          });
        }
      },
      child: Container(
        width: widget.cardWidth,
        // height: widget.cardHeight,
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: isHover
              ? _themeProvider.lightTheme
                  ? kPrimaryLightColor
                  : kPrimaryColor
              : _themeProvider.lightTheme
                  ? Colors.white
                  : Colors.grey[900],
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(100),
              blurRadius: 6.0,
              offset: Offset(0.0, 0.0),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.projectIconData != null
                ? Icon(
                    widget.projectIconData,
                    color: isHover
                        ? _themeProvider.lightTheme
                            ? Colors.black
                            : Colors.white
                        : _themeProvider.lightTheme
                            ? kPrimaryLightColor
                            : kPrimaryColor,
                  )
                : Container(),
            AdaptiveText(
              widget.projectDescription,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  fontSize: height * 0.015,
                  letterSpacing: 2.0,
                  color: isHover
                      ? _themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white
                      : _themeProvider.lightTheme
                          ? kPrimaryLightColor
                          : kPrimaryColor,
                  fontWeight: FontWeight.w400,
                  height: width >= 600 ? 2.0 : 1.2),
            ),
            SizedBox(
              height: height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
