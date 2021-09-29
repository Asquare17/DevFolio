import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OutlinedCustomBtn extends StatefulWidget {
  final String btnText;
  final Function onPressed;
  final bool online;

  const OutlinedCustomBtn(
      {Key key,
      @required this.btnText,
      @required this.onPressed,
      this.online = true})
      : super(key: key);

  @override
  _OutlinedCustomBtnState createState() => _OutlinedCustomBtnState();
}

class _OutlinedCustomBtnState extends State<OutlinedCustomBtn> {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialButton(
      color: kPrimaryLightColor,
      disabledColor: Colors.grey,
      elevation: 5.0,
      hoverColor: kPrimaryLightColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: widget.online ? kPrimaryLightColor : Colors.grey,
          )),
      onPressed: widget.online ? widget.onPressed : null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          widget.btnText,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CustomFilledBtn extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final Function onPressed;
  final Color btnColor;
  const CustomFilledBtn(
      {Key key,
      this.height,
      this.btnColor,
      this.width = 200.0,
      this.onPressed,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: MaterialButton(
        color: btnColor,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
