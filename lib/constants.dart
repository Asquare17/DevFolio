import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Colors
const Color kPrimaryColor = Color(0xFF64ffda);
const Color kPrimaryLightColor = Color(0xFF45B39D);
// Color(0xFF57cbff);
// Color(0xffC0392B);
const Color kDarkBackground = Color(0xFF020c1b); //Color(0xFF26252C)
const Color kLightBackground = Color(0xFFFFFFFF);
const kLightWhite = Color(0xFFe6f1ff);
const Color darKLightNavy = Color(0xFF112240);
Color kFooter = Colors.grey[900];

// Social Media
const kSocialIcons = [
  "https://img.icons8.com/android/480/ffffff/twitter.png",
  "https://img.icons8.com/metro/308/ffffff/linkedin.png",
  "https://img.icons8.com/material-rounded/384/ffffff/github.png",
  // "https://img.icons8.com/ios-filled/500/ffffff/medium-monogram--v1.png"
];

const kSocialLinks = [
  "https://twitter.com/abdwahabrasaq",
  "https://linkedin.com/in/asquare17",
  "https://github.com/Asquare17",
  // "https://mhamzadev.medium.com"
];

// URL Launcher
void launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

// Community
// final kCommunityLogo = [
//   'assets/cui.png',
//   'assets/flutterIsl.png',
//   'assets/dsc.png'
// ];

// final kCommunityLinks = [
//   "https://www.comsats.edu.pk/",
//   "https://web.facebook.com/FlutterIslamabadPakistan/",
//   "https://dsc.community.dev/comsats-university-islamabad/"
// ];

// Tools & Tech
final kTools = [
  "Flutter",
  "Dart",
  "Kotlin",
  "Firebase",
  "Swift",
  "HTML",
  "CSS",
  "Python"
];

// services
// final kServicesIcons = [
//   "assets/services/app.png",
//   "assets/services/ui.png",
//   "assets/services/rapid.png",
//   "assets/services/blog.png",
//   "assets/services/open.png",
// ];

final kServicesTitles = [
  "Full App Development",
  "UI/UX Designing",
  "Rapid Prototyping",
  "Technical Blog Writing",
  "Open Source - GitHub",
];

// final kServicesDescriptions = [
//   "For now, I can only develop Android Apps using Flutter, that's because I don't own a MacBook right now so can't test or debug apps for iOS. Hopefully this missing piece will be filled soon ",
//   "Although I'm mainly a flutter developer but I do care about the UI/UX for my client. Hence, I also do UI designing for applications. So, feel free to ask me for getting you UI/UX for your apps",
//   "Having a startup idea? Or maybe just want a prototype for your clients? With Flutter I can get you basic version of your app in no time and you are good to go for your project in future.",
//   "I have been writing technical blogs on Medium for over a year now. So, I can get you technical blogs with awesome header images with interesting topics.\nMy Medium profile @mhamzadev",
//   "Working as open source contributor on GitHub with 200+ stars and numerous forks on various projects liked and shared by other developers.\nMy GitHub Profile @mhmzdev",
// ];

// final kServicesDescriptions = [
//   "Android app development via Flutter\n- Splash Screen\n- Firebase Auth/Cloud\n- REST APIs\n- Maps integration and more...!",
//   "Modern UI/UX Designing\n- Adobe XD\n- Mobile & Web designs\n- Interactive UI designs\n- Responsiveness\n- Promo Videos and more..!",
//   "Rapid Prototype via Flutter\n- Working MVP\n- Quick & Working prototype",
//   "Technical Blog writing\n- Medium blogs\n- Soothing header images\n- SEO friendly\n- Researched topics and more..!",
//   "Open source GitHub Projects\n- Awesome README.md\n- Well documented\n- Header images and more...!",
// ];

// final kServicesLinks = [
//   "https://www.fiverr.com/hamza6shakeel/be-your-mobile-app-developer-via-flutter",
//   "https://www.fiverr.com/hamza6shakeel/get-you-modern-ui-design-using-adobe-xd",
//   "https://www.fiverr.com/hamza6shakeel/be-your-mobile-app-developer-via-flutter",
//   "https://mhamzadev.medium.com",
//   "https://github.com/mhmzdev"
// ];

// projects
final kProjectsBanner = [
  "assets/projects/medkitB.png",
  "assets/projects/quranB.png",
  "assets/projects/hereiamB.png",
  "assets/projects/covidB.png",
];

final kProjectsIcons = [
  "assets/projects/medkit.png",
  "assets/projects/quran.png",
  "assets/projects/hereiam.png",
  "assets/projects/covid.png",
  "assets/projects/messenger.png",
  "assets/projects/flutter.png",
  "assets/projects/earbender.png",
  "assets/projects/java.png",
  "assets/projects/android.png",
  "assets/services/open.png",
];

final kProjectsTitles = [
  "MedKit",
  "The Holy Qur'an",
  "Here I Am",
  "COVID-19",
  "Messenger Chat Head UI",
  "flutter.dev - Flutter Web",
  "Earbender",
  "File Transfer Protocol",
  "My Order",
  "Hidev",
];

final kProjectsDescriptions = [
  "A Phramacy app developed using Flutter powered with Firebase as database with Doctor and Patient panels.",
  "Application of Holy book of Muslims, Al-Qur'an. Developed using Flutter. Powered with live RestAPI given in README.md",
  "Here I am is an Alert app that Sends alert SMS holding your location (Address and Google Maps) to your loved ones.",
  "A live trakcer for COVID19 stats across the Globe and my Home country Pakistan. It uses APIs so the data is live.",
  "Tried to clone the famous Chat Heads by Facebook Messenger using Flutter. Its basically in-app not exactly like the original chat head.",
  "Flutter Official Site clone using Flutter Web. Try the live site here. For the time being its not responsive fully so there might be responsiveness issues.",
  "A concept of Music App developed using Flutter. Having functionality of playing Audio.",
  "A simple GUI based Java application that sends file from Client to Server but not the other way around.",
  "A concept app for self-services at various restaurants now a days. More like a Restaurant Ordering System.",
  "Its my end semester project. The whole design I developed here is an inspiration from my favortie Flutter Developer Marcin Szałek and his blog Fidev."
];

final kProjectsLinks = [
  "https://github.com/mhmzdev/MedKit-Pharmacy-App-Using-Flutter",
  "https://github.com/mhmzdev/The_Holy_Quran_App",
  "https://github.com/mhmzdev/Here-I-Am-Alert-App",
  "https://github.com/mhmzdev/Covid19-Tracker-App",
  "https://github.com/mhmzdev/Messenger-Chat-Head-Flutter-UI",
  "https://github.com/mhmzdev/flutter.dev-Flutter-Web-Clone",
  "https://github.com/mhmzdev/Earbender_Music_App",
  "https://github.com/mhmzdev/FTP_GUI_Java",
  "https://github.com/mhmzdev/My-Order-Resturant-Ordering-System",
  "https://github.com/mhmzdev/Hidev_Web",
];

// Contact
final kContactIcons = [
  Icons.mail,
  Icons.phone,
  Icons.home,
];

final kContactTitles = [
  "Email",
  "Phone",
  "Location",
];

final kContactDetails = [
  "asquare.shola@gmail.com",
  "+234 806 965 5404",
  "Lagos, Nigeria",
];

final kContactFunction = [
  "mailto:asquare.shola@gmail.com",
  "tel:+234 806 965 5404",
];
