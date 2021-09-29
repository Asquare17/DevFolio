final bool Function(String) emailRegEx = (String emailText) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(emailText);
};

String Function(String) emailVal = (val) {
  if (val.isEmpty) {
    return 'Please enter your e-mail';
  } else if (emailRegEx(val)) {
    return null;
  } else {
    return 'Enter a valid e-mail';
  }
};
String Function(String) emptyVal = (val) {
  if (val.isEmpty) {
    return 'Please enter your message';
  } else {
    return null;
  }
};
