import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class NavBarLogo extends StatelessWidget {
  final double height;
  final Color color;
  NavBarLogo({this.height, this.color});
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width < 1100 ? 0.0 : 12.0, 10.0, 0, 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "< ",
            style: TextStyle(
              fontSize: height ?? 20,
              color: color ??
                  (_themeProvider.lightTheme ? Colors.black : Colors.white),
            ),
          ),
          Text(
            "A",
            style: TextStyle(
              // fontFeatures: [
              //   FontFeature.enable("sups"),
              // ],
              fontFamily: "Agustina",
              fontSize: height ?? 20,
              color: color ??
                  (_themeProvider.lightTheme ? Colors.black : Colors.white),
            ),
          ),
          Transform.translate(
            offset: Offset(2, (-(height ?? 20) / 2.5)),
            child: Text(
              "2",
              style: TextStyle(
                // fontFeatures: [
                //   FontFeature.enable("sups"),
                // ],
                fontFamily: "Agustina",
                fontSize: (height ?? 20),
                color: color ??
                    (_themeProvider.lightTheme ? Colors.black : Colors.white),
              ),
            ),
          ),
          Text(
            MediaQuery.of(context).size.width >= 1000 ? " />\t\t" : " />",
            style: TextStyle(
              fontSize: height ?? 20,
              color: color ??
                  (_themeProvider.lightTheme ? Colors.black : Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
