import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:footer/footer_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:footer/footer.dart';
import 'package:button_animations/button_animations.dart';
import 'package:rifal_anandika/halaman_about.dart';
import 'package:rifal_anandika/halaman_projects.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:like_button/like_button.dart';
import 'halaman_home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyWidget(savedThemeMode: savedThemeMode));
}

class MyWidget extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyWidget({super.key, this.savedThemeMode});
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      debugShowFloatingThemeButton: false,
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 251, 254)),
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 28, 27, 31)),
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'rflandkant',
        theme: theme,
        darkTheme: darkTheme,
        home: const SkillsPage(),
      ),
    );
  }
}

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leadingWidth: 75,
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
              child: Container(
                color: const Color.fromARGB(0, 255, 255, 255),
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          toolbarHeight: 70,
          leading: Builder(
            builder: (BuildContext context) {
              return Container(
                margin: EdgeInsets.only(left: 15),
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: 30,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              );
            },
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 15),
              child: Row(
                children: [
                  LikeButton(
                    countPostion: CountPostion.bottom,
                    circleColor:
                        CircleColor(start: Colors.red, end: Colors.red),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Colors.red,
                      dotSecondaryColor: Colors.red,
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.favorite_rounded,
                        color: isLiked ? Colors.pink : Colors.grey,
                        size: 30,
                      );
                    },
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Switch(
                    value: AdaptiveTheme.of(context).mode.isDark,
                    onChanged: (value) {
                      if (value) {
                        AdaptiveTheme.of(context).setDark();
                      } else {
                        AdaptiveTheme.of(context).setLight();
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
        drawer: Drawer(
          backgroundColor: (Theme.of(context).brightness == Brightness.light
              ? Colors.white70
              : Color.fromARGB(225, 25, 25, 25)),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
              child: FooterView(
                children: <Widget>[
                  Container(
                    height: 280,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: (Theme.of(context).brightness == Brightness.light
                            ? Color.fromARGB(255, 206, 206, 206)
                            : Color.fromARGB(255, 28, 27, 31)),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(70),
                            bottomRight: Radius.circular(70)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 9, 177, 17)
                                .withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage('assets/background_drawer.jpg'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Color.fromARGB(153, 0, 0, 0), BlendMode.darken),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: 20, left: 55, right: 55, bottom: 75),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 9, 177, 17),
                                    width: 0.5),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/profil.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Color.fromARGB(255, 206, 206, 206)
                                    : Color.fromARGB(255, 28, 27, 31)),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 185),
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              children: [
                                Text(
                                  'Rifal Anandika Ananta',
                                  style: GoogleFonts.arima(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                DefaultTextStyle(
                                  style: GoogleFonts.arima(
                                    color: Color.fromARGB(255, 207, 207, 207),
                                    fontSize: 12,
                                  ),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TypewriterAnimatedText(
                                        'Frontend Developer',
                                        speed: Duration(milliseconds: 150),
                                      ),
                                      TypewriterAnimatedText(
                                        'Graphic Designer',
                                        speed: Duration(milliseconds: 150),
                                      ),
                                      TypewriterAnimatedText(
                                        'Student',
                                        speed: Duration(milliseconds: 150),
                                      ),
                                    ],
                                    repeatForever: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  ListTile(
                    title: Container(
                      alignment: Alignment.center,
                      child: AnimatedButton(
                        duration: 1,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        child: Text(
                          'Home',
                          style: GoogleFonts.arima(
                            color: Colors.white,
                          ),
                        ),
                        height: 45,
                        width: 150,
                        type: null,
                        isOutline: true,
                        borderColor: Color.fromARGB(170, 0, 68, 5),
                        borderWidth: 1,
                        darkShadow: false,
                        shadowHeightBottom: 4,
                        shadowHeightLeft: 4,
                        borderRadius: 10,
                        color: Color.fromARGB(255, 9, 177, 17),
                        shadowColor: Color.fromARGB(255, 0, 115, 5),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Container(
                      alignment: Alignment.center,
                      child: AnimatedButton(
                        duration: 1,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProjectsPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Projects',
                          style: GoogleFonts.arima(
                            color: Colors.white,
                          ),
                        ),
                        height: 45,
                        width: 150,
                        type: null,
                        isOutline: true,
                        borderColor: Color.fromARGB(170, 0, 68, 5),
                        borderWidth: 1,
                        darkShadow: false,
                        shadowHeightBottom: 4,
                        shadowHeightLeft: 4,
                        borderRadius: 10,
                        color: Color.fromARGB(255, 9, 177, 17),
                        shadowColor: Color.fromARGB(255, 0, 115, 5),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Container(
                      alignment: Alignment.center,
                      child: AnimatedButton(
                        duration: 1,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutPage(),
                            ),
                          );
                        },
                        child: Text(
                          'About Me',
                          style: GoogleFonts.arima(
                            color: Colors.white,
                          ),
                        ),
                        height: 45,
                        width: 150,
                        type: null,
                        isOutline: true,
                        borderColor: Color.fromARGB(170, 0, 68, 5),
                        borderWidth: 1,
                        darkShadow: false,
                        shadowHeightBottom: 4,
                        shadowHeightLeft: 4,
                        borderRadius: 10,
                        color: Color.fromARGB(255, 9, 177, 17),
                        shadowColor: Color.fromARGB(255, 0, 115, 5),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Container(
                      alignment: Alignment.center,
                      child: AnimatedButton(
                        duration: 1,
                        onTap: () =>
                            launch('https://www.rifalananta81@gmail.com/'),
                        child: Text(
                          'Contact Me',
                          style: GoogleFonts.arima(
                            color: Colors.white,
                          ),
                        ),
                        height: 45,
                        width: 150,
                        type: null,
                        isOutline: true,
                        borderColor: Color.fromARGB(170, 0, 68, 5),
                        borderWidth: 1,
                        darkShadow: false,
                        shadowHeightBottom: 4,
                        shadowHeightLeft: 4,
                        borderRadius: 10,
                        color: Color.fromARGB(255, 9, 177, 17),
                        shadowColor: Color.fromARGB(255, 0, 115, 5),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
                footer: Footer(
                  backgroundColor:
                      (Theme.of(context).brightness == Brightness.light
                          ? Color.fromARGB(35, 255, 255, 255)
                          : Color.fromARGB(35, 25, 25, 25)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Be friends with me?',
                        style: GoogleFonts.arima(
                          color:
                              (Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Color.fromARGB(200, 255, 255, 255)),
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                              onTap: () => launch(
                                  'https://www.linkedin.com/in/rifal-anandika-7a7726264/'),
                              child: Icon(
                                FontAwesomeIcons.linkedin,
                                size: 20,
                                color: (Theme.of(context).brightness ==
                                        Brightness.light
                                    ? const Color.fromARGB(125, 0, 0, 0)
                                    : Color.fromARGB(125, 255, 255, 255)),
                              )),
                          SizedBox(width: 10),
                          InkWell(
                              onTap: () => launch(
                                  'https://www.instagram.com/rflandkant/'),
                              child: Icon(
                                FontAwesomeIcons.instagram,
                                size: 20,
                                color: (Theme.of(context).brightness ==
                                        Brightness.light
                                    ? const Color.fromARGB(125, 0, 0, 0)
                                    : Color.fromARGB(125, 255, 255, 255)),
                              )),
                          SizedBox(width: 10),
                          InkWell(
                              onTap: () => launch(
                                  'https://web.facebook.com/rifal.anandika.a'),
                              child: Icon(
                                FontAwesomeIcons.facebook,
                                size: 20,
                                color: (Theme.of(context).brightness ==
                                        Brightness.light
                                    ? const Color.fromARGB(125, 0, 0, 0)
                                    : Color.fromARGB(125, 255, 255, 255)),
                              )),
                          SizedBox(width: 10),
                          InkWell(
                              onTap: () =>
                                  launch('https://twitter.com/RifalAnandika'),
                              child: Icon(
                                FontAwesomeIcons.twitter,
                                size: 20,
                                color: (Theme.of(context).brightness ==
                                        Brightness.light
                                    ? const Color.fromARGB(125, 0, 0, 0)
                                    : Color.fromARGB(125, 255, 255, 255)),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                flex: 6,
              ),
            ),
          ),
        ),
        body: FooterView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 110, bottom: 100),
              alignment: Alignment.topCenter,
              child: Stack(
                children: <Widget>[
                  Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 80,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                              top: 40,
                              left: 25,
                              right: 25,
                            ),
                            width: 1250,
                            padding: EdgeInsets.only(
                              left: 50,
                              top: 75,
                              bottom: 20,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Color.fromARGB(255, 255, 251, 254)
                                      : Colors.transparent),
                                  (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Color.fromARGB(197, 92, 255, 100)
                                      : Color.fromARGB(255, 9, 177, 17)),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logohtml.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'HTML',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Experienced',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logocss.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'CSS',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Experienced',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logobootstrap.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Bootstrap',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Intermediate',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logodart.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Dart',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Intermediate',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logoflutter.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Flutter',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Experienced',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                AssetImage('assets/logojs.jpg'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Javascript',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Beginner',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logonodejs.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Node.js',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Beginner',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logophp.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'PHP',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Beginner',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logolaravel.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Laravel',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Beginner',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                AssetImage('assets/logoci.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'CodeIgniter',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Beginner',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logoblogger.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Blogger',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Experienced',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                AssetImage('assets/logowp.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Wordpress',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Intermediate',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logowix.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'WIX',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Intermediate',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              'My Skills',
                              style: GoogleFonts.arima(
                                fontSize: 45,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                              top: 40,
                              left: 25,
                              right: 25,
                            ),
                            width: 1250,
                            padding: EdgeInsets.only(
                              left: 50,
                              top: 75,
                              bottom: 20,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Color.fromARGB(255, 255, 251, 254)
                                      : Colors.transparent),
                                  (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Color.fromARGB(197, 92, 255, 100)
                                      : Color.fromARGB(255, 9, 177, 17)),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logovscode.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Visual Studio Code',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Experienced',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logofirebase.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Firebase',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Beginner',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logoxampp.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'XAMPP',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Experienced',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logomysql.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'MySQL',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Intermediate',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logogit.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Git',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Experienced',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logonetlify.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Netlify',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Experienced',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logovercel.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Vercel',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Experienced',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logofigma.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Figma',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Beginner',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logocanva.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Canva',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Experienced',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logocoreldraw.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'CorelDraw',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Experienced',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logophotoshop.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Photoshop',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Beginner',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/logocapcut.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Capcut',
                                        style: GoogleFonts.arima(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      Text(
                                        'Intermediate',
                                        style: GoogleFonts.arima(
                                          fontSize: 11.5,
                                          color: (Theme.of(context)
                                                      .brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(225, 25, 25, 25)
                                              : Color.fromARGB(
                                                  200, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              'Tools',
                              style: GoogleFonts.arima(
                                fontSize: 45,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
          footer: Footer(
            backgroundColor: Colors.transparent,
            child: Text(
              'Copyright © 2023 Rifal Anandika. All rights reserved.',
              style: GoogleFonts.arima(
                fontSize: 12,
                color: (Theme.of(context).brightness == Brightness.light
                    ? Colors.black54
                    : Colors.white60),
              ),
            ),
          ),
          flex: 10,
        ),
      ),
    );
  }
}
