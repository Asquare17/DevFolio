import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:provider/provider.dart';

class ToolTechWidget extends StatelessWidget {
  final String techName;
  final double fontSize;

  const ToolTechWidget({Key key, this.techName, this.fontSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            color:
                _themeProvider.lightTheme ? kPrimaryLightColor : kPrimaryColor,
            size: fontSize ?? MediaQuery.of(context).size.height * 0.02,
          ),
          AdaptiveText(
            " $techName ",
            style: TextStyle(
              fontSize: fontSize,
              color: _themeProvider.lightTheme ? Colors.black : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
