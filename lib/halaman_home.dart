import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:footer/footer_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:footer/footer.dart';
import 'package:button_animations/button_animations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:like_button/like_button.dart';
import 'halaman_skills.dart';
import 'halaman_projects.dart';
import 'halaman_about.dart';
import 'halaman_tools.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<String> imgList = [
  'assets/content1.png',
  'assets/content2.png',
  'assets/content3.png',
];

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: 1000.0,
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
int _current = 0;

final CarouselController _controller = CarouselController();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          leadingWidth: 75,
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
              child: Container(
                color: const Color.fromARGB(0, 255, 255, 255),
              ),
            ),
          ),
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
                                    color: Colors.white,
                                    fontSize: 20,
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
                              builder: (context) => SkillsPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Skills',
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
                                  : Colors.white),
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
                          SizedBox(
                            width: 10,
                          ),
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
                          SizedBox(
                            width: 10,
                          ),
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
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 50, top: 115, right: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "Hi, I’m Rifal and I’m a",
                          style: GoogleFonts.arima(
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                          textScaleFactor: ScaleSize.textScaleFactor(context),
                        ),
                      ),
                      Container(
                        child: FittedBox(
                            child: AnimatedTextKit(
                          pause: Duration(seconds: 10),
                          animatedTexts: [
                            WavyAnimatedText(
                              speed: Duration(milliseconds: 250),
                              'Frontend Developer',
                              textStyle: GoogleFonts.rampartOne(
                                  color: Color.fromARGB(255, 9, 177, 17),
                                  fontSize: 70),
                            ),
                            WavyAnimatedText(
                              speed: Duration(milliseconds: 250),
                              'Graphic Designer',
                              textStyle: GoogleFonts.rampartOne(
                                  color: Color.fromARGB(255, 9, 177, 17),
                                  fontSize: 70),
                            ),
                          ],
                          isRepeatingAnimation: true,
                          repeatForever: true,
                        )),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Text(
                          "I always use my logical side and my creative side throughout the day.",
                          style: GoogleFonts.arima(
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                          textScaleFactor: ScaleSize.textScaleFactor(context),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: 0.6,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 10),
                      autoPlayAnimationDuration: Duration(milliseconds: 3000),
                      autoPlayCurve: Curves.elasticOut,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                      aspectRatio: 2.7,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  items: imageSliders,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 8,
                        height: 8,
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          margin: EdgeInsets.only(top: 75),
                          decoration: BoxDecoration(
                            color: (Theme.of(context).brightness ==
                                    Brightness.light
                                ? Color.fromARGB(255, 9, 177, 17)
                                : Color.fromARGB(255, 0, 112, 28)),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(
                              top: 150,
                              bottom: 35,
                            ),
                            alignment: Alignment.topCenter,
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 25,
                              runSpacing: 25,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 40,
                                      ),
                                      width: 275,
                                      padding: EdgeInsets.only(
                                        left: 50,
                                        top: 40,
                                        right: 50,
                                        bottom: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              (Theme.of(context).brightness ==
                                                      Brightness.light
                                                  ? Color.fromARGB(
                                                      255, 9, 177, 17)
                                                  : Color.fromARGB(
                                                      255, 0, 112, 28)),
                                              (Theme.of(context).brightness ==
                                                      Brightness.light
                                                  ? Color.fromARGB(
                                                      255, 0, 112, 28)
                                                  : Color.fromARGB(
                                                      255, 9, 177, 17)),
                                            ]),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/logohtml.png'),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'HTML',
                                                    style: GoogleFonts.arima(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Experienced',
                                                    style: GoogleFonts.arima(
                                                      fontSize: 11.5,
                                                      color: Color.fromARGB(
                                                          200, 255, 255, 255),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/logocss.png'),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'CSS',
                                                    style: GoogleFonts.arima(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Experienced',
                                                    style: GoogleFonts.arima(
                                                      fontSize: 11.5,
                                                      color: Color.fromARGB(
                                                          200, 255, 255, 255),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/logobootstrap.png'),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Bootstrap',
                                                    style: GoogleFonts.arima(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Intermediate',
                                                    style: GoogleFonts.arima(
                                                      fontSize: 11.5,
                                                      color: Color.fromARGB(
                                                          200, 255, 255, 255),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/logodart.png'),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Dart',
                                                    style: GoogleFonts.arima(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Intermediate',
                                                    style: GoogleFonts.arima(
                                                      fontSize: 11.5,
                                                      color: Color.fromARGB(
                                                          200, 255, 255, 255),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/logoflutter.png'),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Flutter',
                                                    style: GoogleFonts.arima(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Experienced',
                                                    style: GoogleFonts.arima(
                                                      fontSize: 11.5,
                                                      color: Color.fromARGB(
                                                          200, 255, 255, 255),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          AnimatedButton(
                                            duration: 1,
                                            child: Text(
                                              'Show More',
                                              style: GoogleFonts.arima(
                                                fontSize: 13,
                                                color: Colors.white,
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      SkillsPage(),
                                                ),
                                              );
                                            },
                                            type: null,
                                            isOutline: true,
                                            borderColor:
                                                Color.fromARGB(170, 0, 68, 5),
                                            borderWidth: 1,
                                            height: 25,
                                            width: 100,
                                            borderRadius: 22.5,
                                            color:
                                                Color.fromARGB(255, 9, 177, 17),
                                            shadowColor:
                                                Color.fromARGB(255, 0, 115, 5),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: Text(
                                        'My Skills',
                                        style: GoogleFonts.arima(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
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
                                      ),
                                      width: 275,
                                      padding: EdgeInsets.only(
                                        left: 50,
                                        top: 40,
                                        right: 50,
                                        bottom: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              (Theme.of(context).brightness ==
                                                      Brightness.light
                                                  ? Color.fromARGB(
                                                      255, 9, 177, 17)
                                                  : Color.fromARGB(
                                                      255, 0, 112, 28)),
                                              (Theme.of(context).brightness ==
                                                      Brightness.light
                                                  ? Color.fromARGB(
                                                      255, 0, 112, 28)
                                                  : Color.fromARGB(
                                                      255, 9, 177, 17)),
                                            ]),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/logovscode.png'),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Visual Studio Code',
                                                    style: GoogleFonts.arima(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Experienced',
                                                    style: GoogleFonts.arima(
                                                      fontSize: 11,
                                                      color: Color.fromARGB(
                                                          200, 255, 255, 255),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/logofirebase.png'),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Firebase',
                                                    style: GoogleFonts.arima(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Beginner',
                                                    style: GoogleFonts.arima(
                                                      fontSize: 11.5,
                                                      color: Color.fromARGB(
                                                          200, 255, 255, 255),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/logoxampp.png'),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'XAMPP',
                                                    style: GoogleFonts.arima(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Experienced',
                                                    style: GoogleFonts.arima(
                                                      fontSize: 11.5,
                                                      color: Color.fromARGB(
                                                          200, 255, 255, 255),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/logomysql.png'),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'MySQL',
                                                    style: GoogleFonts.arima(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Intermediate',
                                                    style: GoogleFonts.arima(
                                                      fontSize: 11.5,
                                                      color: Color.fromARGB(
                                                          200, 255, 255, 255),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/logogit.png'),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Git',
                                                    style: GoogleFonts.arima(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Experienced',
                                                    style: GoogleFonts.arima(
                                                      fontSize: 11.5,
                                                      color: Color.fromARGB(
                                                          200, 255, 255, 255),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          AnimatedButton(
                                            duration: 1,
                                            child: Text(
                                              'Show More',
                                              style: GoogleFonts.arima(
                                                fontSize: 13,
                                                color: Colors.white,
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ToolsPage(),
                                                ),
                                              );
                                            },
                                            type: null,
                                            isOutline: true,
                                            borderColor:
                                                Color.fromARGB(170, 0, 68, 5),
                                            borderWidth: 1,
                                            height: 25,
                                            width: 100,
                                            borderRadius: 22.5,
                                            color:
                                                Color.fromARGB(255, 9, 177, 17),
                                            shadowColor:
                                                Color.fromARGB(255, 0, 115, 5),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: Text(
                                        'Tools',
                                        style: GoogleFonts.arima(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
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
                                      ),
                                      padding: EdgeInsets.only(
                                        left: 50,
                                        top: 70,
                                        bottom: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              (Theme.of(context).brightness ==
                                                      Brightness.light
                                                  ? Color.fromARGB(
                                                      255, 9, 177, 17)
                                                  : Color.fromARGB(
                                                      255, 0, 112, 28)),
                                              (Theme.of(context).brightness ==
                                                      Brightness.light
                                                  ? Color.fromARGB(
                                                      255, 0, 112, 28)
                                                  : Color.fromARGB(
                                                      255, 9, 177, 17)),
                                            ]),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Wrap(
                                            alignment: WrapAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: 50, bottom: 50),
                                                width: 165,
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(25),
                                                      decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 250, 250, 250),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    7,
                                                                    201,
                                                                    17),
                                                            offset:
                                                                Offset(0, 0),
                                                            blurRadius: 5,
                                                            spreadRadius: 3,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Icon(
                                                        Icons.computer_rounded,
                                                        size: 75,
                                                        color: Color.fromARGB(
                                                            255, 9, 177, 17),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'Web Development',
                                                          style:
                                                              GoogleFonts.arima(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Having a responsive website and beautiful design is a satisfaction for its users.',
                                                          style:
                                                              GoogleFonts.arima(
                                                            fontSize: 11.5,
                                                            color:
                                                                Color.fromARGB(
                                                                    200,
                                                                    255,
                                                                    255,
                                                                    255),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: 50, bottom: 50),
                                                width: 165,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(25),
                                                      decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 250, 250, 250),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    7,
                                                                    201,
                                                                    17),
                                                            offset:
                                                                Offset(0, 0),
                                                            blurRadius: 5,
                                                            spreadRadius: 3,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Icon(
                                                        Icons
                                                            .phone_android_rounded,
                                                        size: 75,
                                                        color: Color.fromARGB(
                                                            255, 9, 177, 17),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'Mobile App',
                                                          style:
                                                              GoogleFonts.arima(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Dynamic and advanced applications for a better experience.',
                                                          style:
                                                              GoogleFonts.arima(
                                                            fontSize: 11.5,
                                                            color:
                                                                Color.fromARGB(
                                                                    200,
                                                                    255,
                                                                    255,
                                                                    255),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  right: 50,
                                                ),
                                                width: 165,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(25),
                                                      decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 250, 250, 250),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    7,
                                                                    201,
                                                                    17),
                                                            offset:
                                                                Offset(0, 0),
                                                            blurRadius: 5,
                                                            spreadRadius: 3,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Icon(
                                                        Icons
                                                            .design_services_rounded,
                                                        size: 75,
                                                        color: Color.fromARGB(
                                                            255, 9, 177, 17),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'Graphic Design',
                                                          style:
                                                              GoogleFonts.arima(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Making sure no small details are overlooked to produce a beautiful design.',
                                                          style:
                                                              GoogleFonts.arima(
                                                            fontSize: 11.5,
                                                            color:
                                                                Color.fromARGB(
                                                                    200,
                                                                    255,
                                                                    255,
                                                                    255),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: Text(
                                        'Services',
                                        style: GoogleFonts.arima(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(
                              left: 25,
                              top: 20,
                              right: 25,
                            ),
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: (Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Color.fromARGB(255, 255, 251, 254)
                                  : Color.fromARGB(255, 28, 27, 31)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/quotes.jpg',
                                  ),
                                  colorFilter: ColorFilter.mode(
                                      (Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.transparent
                                          : Color.fromARGB(180, 0, 0, 0)),
                                      BlendMode.darken)),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Color.fromARGB(255, 0, 112, 28)
                                      : Color.fromARGB(255, 0, 61, 15)),
                                  spreadRadius: 0,
                                  offset: Offset(0, 7),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    '"',
                                    style: GoogleFonts.bizUDPGothic(
                                      color: (Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.black
                                          : Colors.white),
                                      fontSize: 100,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 72, left: 12.5, right: 12.5),
                                  child: Column(
                                    children: [
                                      Text(
                                        'As a frontend developer and graphic designer, I always try to give the best in creating designs, my goal is for users to be satisfied and happy with the results obtained. I would be honored if you offered me some projects or invited me to collaborate.',
                                        style: GoogleFonts.arima(
                                            fontSize: 11,
                                            color:
                                                (Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black
                                                    : Colors.white)),
                                        textAlign: TextAlign.center,
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Want to know more',
                                            style: GoogleFonts.arima(
                                              fontSize: 10,
                                              color: (Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? Colors.black
                                                  : Colors.white),
                                            ),
                                            textScaleFactor:
                                                ScaleSize.textScaleFactor(
                                                    context),
                                          ),
                                          SizedBox(
                                            width: 3.5,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      AboutPage(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'about me?',
                                              style: GoogleFonts.arima(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                                color: (Theme.of(context)
                                                            .brightness ==
                                                        Brightness.light
                                                    ? Color.fromARGB(
                                                        255, 9, 177, 17)
                                                    : Color.fromARGB(
                                                        255, 0, 224, 11)),
                                              ),
                                              textScaleFactor:
                                                  ScaleSize.textScaleFactor(
                                                      context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
          footer: Footer(
            backgroundColor: (Theme.of(context).brightness == Brightness.light
                ? Color.fromARGB(255, 9, 177, 17)
                : Color.fromARGB(255, 0, 112, 28)),
            child: Text(
              'Copyright © 2023 Rifal Anandika. All rights reserved.',
              style: GoogleFonts.arima(
                fontSize: 12,
                color: Colors.white60,
              ),
            ),
          ),
          flex: 10,
        ),
      ),
    );
  }
}
