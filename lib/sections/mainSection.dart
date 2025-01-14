import 'package:animated_background/animated_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:folio/animations/entranceFader.dart';
import 'package:folio/constants.dart';
import 'package:folio/sections/about/about.dart';
import 'package:folio/sections/contact/contact.dart';
import 'package:folio/sections/home/home.dart';
import 'package:folio/sections/navBar/navBarLogo.dart';
import 'package:folio/sections/portfolio/portfolio.dart';
import 'package:folio/widget/arrowOnTop.dart';
import 'package:folio/widget/footer.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  ThemeProvider _themeProviders = ThemeProvider();
  bool isPressed = false;
  bool _isScrollingDown = false;
  ScrollController _scrollController = ScrollController();

  final List<String> _sectionsName = [
    "HOME",
    "ABOUT",
    // "SERVICES",
    "PROJECTS",
    "CONTACT",
  ];

  final List<IconData> _sectionsIcons = [
    Icons.home,
    Icons.person,
    // Icons.settings,
    Icons.build,
    Icons.article,
    Icons.phone,
  ];

  void _scroll(int i) {
    _scrollController.animateTo(
      i == 0
          ? 0.0
          : i == 1
              ? MediaQuery.of(context).size.height * 1.05
              : i == 2
                  ? MediaQuery.of(context).size.height * 1.98
                  : i == 3
                      ? MediaQuery.of(context).size.height * 2.9
                      : MediaQuery.of(context).size.height * 4,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  Widget sectionWidget(int i) {
    if (i == 0) {
      return HomePage();
    } else if (i == 1) {
      return About();
    } else if (i == 2) {
      return Portfolio();
    } else if (i == 3) {
      return Contact();
    } else if (i == 4) {
      return Footer();
    } else {
      return Container();
    }
  }

  @override
  void initState() {
    _scrollController = _themeProviders.scroll;
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!_isScrollingDown) {
          _isScrollingDown = true;
          setState(() {});
        }
      }

      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_isScrollingDown) {
          _isScrollingDown = false;
          setState(() {});
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _themeProv = Provider.of<ThemeProvider>(context);
    return
        // AnimatedBackground(
        // //  behaviour: RandomParticleBehaviour(),
        //   vsync: this,
        //   child:
        Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor:
          _themeProv.lightTheme ? kLightBackground : kDarkBackground,
      appBar: MediaQuery.of(context).size.width < 760
          ? AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              elevation: 0,
              backgroundColor: kFooter,
              actions: [
                NavBarLogo(
                  color: Colors.white,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                )
              ],
            )
          : _appBarTabDesktop(_themeProv),
      drawer: MediaQuery.of(context).size.width < 760
          ? _appBarMobile(_themeProv)
          : null,
      body: Stack(
        children: [
          AnimatedBackground(
            behaviour: RandomParticleBehaviour(
                options: ParticleOptions(
              baseColor:
                  _themeProv.lightTheme ? kPrimaryLightColor : kPrimaryColor,
              spawnOpacity: 0.0,
              opacityChangeRate: 0.25,
              minOpacity: 0.4,
              maxOpacity: 0.7,
              spawnMinSpeed: 30.0,
              spawnMaxSpeed: 70.0,
              spawnMinRadius: 4.0,
              spawnMaxRadius: 6.0,
              particleCount: 20,
            )),
            vsync: this,
            child: SectionsBody(
              scrollController: _scrollController,
              sectionsLength: _sectionsIcons.length,
              sectionWidget: sectionWidget,
            ),
          ),
          _isScrollingDown
              ? Positioned(
                  bottom: 90,
                  right: 0,
                  child: EntranceFader(
                      offset: Offset(0, 20),
                      child: ArrowOnTop(
                        onPressed: () => _scroll(0),
                      )))
              : Container()
        ],
      ),
      // ),
    );
  }

  Widget _appBarActions(
      String childText, int index, IconData icon, ThemeProvider themeProvider) {
    return MediaQuery.of(context).size.width > 760
        ? EntranceFader(
            offset: Offset(0, -10),
            delay: Duration(milliseconds: 100),
            duration: Duration(milliseconds: 250),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 60.0,
              child: MaterialButton(
                hoverColor: themeProvider.lightTheme
                    ? kPrimaryLightColor
                    : kPrimaryColor,
                onPressed: () => _scroll(index),
                child: Text(
                  childText,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              hoverColor: (themeProvider.lightTheme
                      ? kPrimaryLightColor
                      : kPrimaryColor)
                  .withAlpha(70),
              onPressed: () {
                _scroll(index);
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(
                  icon,
                  color: themeProvider.lightTheme
                      ? kPrimaryLightColor
                      : kPrimaryColor,
                ),
                title: Text(childText,
                    style: TextStyle(
                      color: themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                    )),
              ),
            ),
          );
  }

  Widget _appBarTabDesktop(ThemeProvider _themeProv) {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: kFooter,
      title: MediaQuery.of(context).size.width < 780
          ? EntranceFader(
              duration: Duration(milliseconds: 250),
              offset: Offset(0, -10),
              delay: Duration(seconds: 3),
              child: NavBarLogo(
                color: Colors.white,
                height: 20.0,
              ))
          : EntranceFader(
              offset: Offset(0, -10),
              duration: Duration(milliseconds: 250),
              delay: Duration(milliseconds: 100),
              child: NavBarLogo(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.035,
              ),
            ),
      actions: [
        for (int i = 0; i < _sectionsName.length; i++)
          _appBarActions(_sectionsName[i], i, _sectionsIcons[i], _themeProv),
        Container(
          height: 45.0,
          width: 120.0,
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            hoverColor:
                (_themeProv.lightTheme ? kPrimaryLightColor : kPrimaryColor)
                    .withAlpha(150),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(
                    color: _themeProv.lightTheme
                        ? kPrimaryLightColor
                        : kPrimaryColor)),
            onPressed: () {
              html.window.open(
                  'https://drive.google.com/file/d/1GF-wtbu2ob_Uxhw2In2QA8QiYi3XjCj1/view?usp=sharing',
                  "pdf");
            },
            child: Text(
              "RESUME",
              style: GoogleFonts.montserrat(
                color: Colors
                    .white, // _themeProv.lightTheme ? Colors.black : Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        const SizedBox(width: 15.0),
        SizedBox(
          height: 30.0,
          child: IconButton(
            onPressed: () {
              _themeProv.lightTheme = !_themeProv.lightTheme;
            },
            icon: Icon(
              _themeProv.lightTheme
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 15.0),
      ],
    );
  }

  Widget _appBarMobile(ThemeProvider theme) {
    return Drawer(
      child: Material(
        color: theme.lightTheme ? Colors.white : Colors.grey[900],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 12),
              child: Center(
                child: NavBarLogo(
                  height: 28,
                ),
              ),
            ),
            Divider(
              color: theme.lightTheme ? Colors.grey[200] : Colors.white,
            ),
            for (int i = 0; i < _sectionsName.length; i++)
              _appBarActions(_sectionsName[i], i, _sectionsIcons[i], theme),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                hoverColor:
                    (theme.lightTheme ? kPrimaryLightColor : kPrimaryColor)
                        .withAlpha(150),
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(5.0),
                //     side: BorderSide(color: kPrimaryColor)),
                onPressed: () {
                  launchURL(
                      "https://drive.google.com/file/d/1GF-wtbu2ob_Uxhw2In2QA8QiYi3XjCj1/view?usp=sharing");
                },
                child: ListTile(
                  leading: Icon(
                    Icons.book,
                    color:
                        theme.lightTheme ? kPrimaryLightColor : kPrimaryColor,
                  ),
                  title: Text(
                    "RESUME",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w300,
                      color: theme.lightTheme ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              color: theme.lightTheme ? Colors.grey[200] : Colors.white,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: ListTile(
                leading: Icon(
                  Icons.light_mode,
                  color: theme.lightTheme ? kPrimaryLightColor : kPrimaryColor,
                ),
                title: Text("Dark Mode",
                    style: TextStyle(
                        color: theme.lightTheme ? Colors.black : Colors.white)),
                trailing: Switch(
                  inactiveTrackColor: Colors.grey,
                  value: !theme.lightTheme,
                  onChanged: (value) {
                    theme.lightTheme = !value;
                  },
                  activeColor:
                      theme.lightTheme ? kPrimaryLightColor : kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionsBody extends StatelessWidget {
  final ScrollController scrollController;
  final int sectionsLength;
  final Widget Function(int) sectionWidget;

  const SectionsBody({
    Key key,
    this.scrollController,
    this.sectionsLength,
    this.sectionWidget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        // physics: !kIsWeb ? ScrollPhysics() : NeverScrollableScrollPhysics(),
        controller: scrollController,
        itemCount: sectionsLength,
        itemBuilder: (contsext, index) => sectionWidget(index),
      ),
    );
  }
}

// onPointerSignal: (ps) {
//           if (ps is PointerScrollEvent) {
//             final newOffset = scrollController.offset + ps.scrollDelta.dy;
//             if (ps.scrollDelta.dy.isNegative) {
//               scrollController.jumpTo(math.max(0, newOffset));
//             } else {
//               scrollController.jumpTo(math.min(
//                   scrollController.position.maxScrollExtent, newOffset));
//             }
//           }
//         },
