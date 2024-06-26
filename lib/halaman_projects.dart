import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:footer/footer_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:footer/footer.dart';
import 'package:button_animations/button_animations.dart';
import 'package:rifal_anandika/halaman_about.dart';
import 'package:rifal_anandika/halaman_skills.dart';
import 'package:rifal_anandika/main.dart';
import 'package:rifal_anandika/show_design.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:like_button/like_button.dart';
import 'halaman_home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer<LikeModel>(
                        builder: (context, likeModel, _) {
                          return LikeButton(
                            size: 30,
                            countPostion: CountPostion.right,
                            bubblesColor: BubblesColor(
                              dotPrimaryColor: likeModel.isLiked
                                  ? Colors.redAccent
                                  : Theme.of(context).brightness ==
                                          Brightness.light
                                      ? const Color.fromARGB(0, 255, 255, 255)
                                      : Colors.transparent,
                              dotSecondaryColor: likeModel.isLiked
                                  ? Colors.redAccent
                                  : Theme.of(context).brightness ==
                                          Brightness.light
                                      ? const Color.fromARGB(0, 255, 255, 255)
                                      : Colors.transparent,
                            ),
                            circleColor: CircleColor(
                              start: likeModel.isLiked
                                  ? Colors.redAccent
                                  : const Color.fromARGB(0, 255, 255, 255),
                              end: likeModel.isLiked
                                  ? Colors.redAccent
                                  : const Color.fromARGB(0, 255, 255, 255),
                            ),
                            likeBuilder: (bool isLiked) {
                              return Icon(
                                Icons.favorite_rounded,
                                color: likeModel.isLiked
                                    ? Colors.redAccent
                                    : Colors.grey,
                                size: 30,
                              );
                            },
                            onTap: (isLiked) async {
                              Provider.of<LikeModel>(context, listen: false)
                                  .incrementLike();
                              return !isLiked;
                            },
                          );
                        },
                      ),
                      SizedBox(height: 1.5),
                      // Indikator Jumlah Like
                      Consumer<LikeModel>(
                        builder: (context, likeModel, _) {
                          return Text(
                            '${likeModel.likeCount}',
                            style: GoogleFonts.arima(fontSize: 12),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Switch(
                    thumbIcon: WidgetStatePropertyAll(Icon(
                        Theme.of(context).brightness == Brightness.light
                            ? Icons.brightness_7
                            : Icons.brightness_4)),
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
                          image:
                              AssetImage('assets/drawer/background_drawer.jpg'),
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
                                    'assets/drawer/profil.png',
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
                                        'Mobile Developer',
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
            Padding(
              padding: EdgeInsets.only(
                top: 110,
              ),
              child: Column(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'My Projects',
                        style: GoogleFonts.arima(
                          fontSize: 45,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'I usually fill my free time by creating several projects.',
                        style: GoogleFonts.arima(
                          fontSize: 12,
                        ),
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 75),
                    padding: EdgeInsets.only(bottom: 65, left: 25, right: 25),
                    child: Wrap(
                      spacing: 75,
                      runSpacing: 75,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 500,
                          child: Column(
                            children: <Widget>[
                              FittedBox(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  child: Image.asset(
                                    'assets/content_projects/content1_projects.png',
                                    width: 500,
                                    height: 352,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Color.fromARGB(255, 193, 225, 204),
                                    ),
                                    right: BorderSide(
                                      color: Color.fromARGB(255, 193, 225, 204),
                                    ),
                                    bottom: BorderSide(
                                      color: Color.fromARGB(255, 193, 225, 204),
                                    ),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '7 Day UI Project',
                                          style: GoogleFonts.arima(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'This is a 7 day challenge project to create a UI, this is one of the projects from my school. I made it with the dart programming language and the flutter framework. Created on 10/05/2023.',
                                          style: GoogleFonts.arima(
                                            fontSize: 10,
                                            color:
                                                (Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Color.fromARGB(
                                                        225, 25, 25, 25)
                                                    : Colors.white70),
                                          ),
                                          textScaleFactor:
                                              ScaleSize.textScaleFactor(
                                                  context),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Wrap(
                                            alignment: WrapAlignment.center,
                                            spacing: 5,
                                            runSpacing: 5,
                                            children: <Widget>[
                                              Container(
                                                height: 30,
                                                width: 130,
                                                child: AnimatedButton(
                                                  duration: 1,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.code_rounded,
                                                        size: 17,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        'Source Code',
                                                        style:
                                                            GoogleFonts.arima(
                                                          fontSize: 12,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  onTap: () {
                                                    launch(
                                                        'https://github.com/rflandkant/7-Day-UI-Project');
                                                  },
                                                  type: null,
                                                  isOutline: true,
                                                  borderColor: Colors.black,
                                                  borderWidth: 1,
                                                  height: 30,
                                                  width: 130,
                                                  borderRadius: 22.5,
                                                  color: Color.fromARGB(
                                                      255, 102, 102, 102),
                                                  shadowColor: Color.fromARGB(
                                                      255, 60, 60, 60),
                                                ),
                                              ),
                                              // Container(
                                              //   height: 30,
                                              //   width: 130,
                                              //   child: AnimatedButton(
                                              //     duration: 1,
                                              //     child: Row(
                                              //       mainAxisAlignment:
                                              //           MainAxisAlignment
                                              //               .center,
                                              //       children: [
                                              //         Icon(
                                              //           Icons
                                              //               .open_in_browser_rounded,
                                              //           size: 17,
                                              //           color: Colors.white,
                                              //         ),
                                              //         SizedBox(
                                              //           width: 5,
                                              //         ),
                                              //         Text(
                                              //           'Demo Project',
                                              //           style:
                                              //               GoogleFonts.arima(
                                              //             fontSize: 12,
                                              //             color: Colors.white,
                                              //           ),
                                              //         ),
                                              //       ],
                                              //     ),
                                              //     onTap: () {},
                                              //     type: null,
                                              //     isOutline: true,
                                              //     borderColor: Color.fromARGB(
                                              //         255, 0, 68, 5),
                                              //     borderWidth: 1,
                                              //     height: 30,
                                              //     width: 130,
                                              //     borderRadius: 22.5,
                                              //     color: Color.fromARGB(
                                              //         255, 9, 177, 17),
                                              //     shadowColor: Color.fromARGB(
                                              //         255, 0, 115, 5),
                                              //   ),
                                              // ),
                                            ],
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
                        Container(
                          width: 500,
                          child: Column(
                            children: <Widget>[
                              FittedBox(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  child: Image.asset(
                                    'assets/content_projects/content2_projects.png',
                                    width: 500,
                                    height: 352,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Color.fromARGB(255, 71, 196, 250),
                                    ),
                                    right: BorderSide(
                                      color: Color.fromARGB(255, 71, 196, 250),
                                    ),
                                    bottom: BorderSide(
                                      color: Color.fromARGB(255, 71, 196, 250),
                                    ),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Attendance Application',
                                          style: GoogleFonts.arima(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'Digital attendance application to facilitate student and teacher attendance. I made it with the dart programming language and the flutter framework. Created on 16/05/2023.',
                                          style: GoogleFonts.arima(
                                            fontSize: 10,
                                            color:
                                                (Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Color.fromARGB(
                                                        225, 25, 25, 25)
                                                    : Colors.white70),
                                          ),
                                          textScaleFactor:
                                              ScaleSize.textScaleFactor(
                                                  context),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Wrap(
                                            alignment: WrapAlignment.center,
                                            spacing: 5,
                                            runSpacing: 5,
                                            children: <Widget>[
                                              Container(
                                                height: 30,
                                                width: 130,
                                                child: AnimatedButton(
                                                  duration: 1,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.code_rounded,
                                                        size: 17,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        'Source Code',
                                                        style:
                                                            GoogleFonts.arima(
                                                          fontSize: 12,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  onTap: () {
                                                    launch(
                                                        'https://github.com/rflandkant/School-Attendance');
                                                  },
                                                  type: null,
                                                  isOutline: true,
                                                  borderColor: Colors.black,
                                                  borderWidth: 1,
                                                  height: 30,
                                                  width: 130,
                                                  borderRadius: 22.5,
                                                  color: Color.fromARGB(
                                                      255, 102, 102, 102),
                                                  shadowColor: Color.fromARGB(
                                                      255, 60, 60, 60),
                                                ),
                                              ),
                                              // Container(
                                              //   height: 30,
                                              //   width: 130,
                                              //   child: AnimatedButton(
                                              //     duration: 1,
                                              //     child: Row(
                                              //       mainAxisAlignment:
                                              //           MainAxisAlignment
                                              //               .center,
                                              //       children: [
                                              //         Icon(
                                              //           Icons
                                              //               .open_in_browser_rounded,
                                              //           size: 17,
                                              //           color: Colors.white,
                                              //         ),
                                              //         SizedBox(
                                              //           width: 5,
                                              //         ),
                                              //         Text(
                                              //           'Demo Project',
                                              //           style:
                                              //               GoogleFonts.arima(
                                              //             fontSize: 12,
                                              //             color: Colors.white,
                                              //           ),
                                              //         ),
                                              //       ],
                                              //     ),
                                              //     onTap: () {},
                                              //     type: null,
                                              //     isOutline: true,
                                              //     borderColor: Color.fromARGB(
                                              //         255, 0, 68, 5),
                                              //     borderWidth: 1,
                                              //     height: 30,
                                              //     width: 130,
                                              //     borderRadius: 22.5,
                                              //     color: Color.fromARGB(
                                              //         255, 9, 177, 17),
                                              //     shadowColor: Color.fromARGB(
                                              //         255, 0, 115, 5),
                                              //   ),
                                              // ),
                                            ],
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
                        Container(
                          width: 500,
                          child: Column(
                            children: <Widget>[
                              FittedBox(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  child: Image.asset(
                                    'assets/content_projects/content4_projects.png',
                                    width: 500,
                                    height: 352,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Color.fromARGB(255, 161, 161, 161),
                                    ),
                                    right: BorderSide(
                                      color: Color.fromARGB(255, 161, 161, 161),
                                    ),
                                    bottom: BorderSide(
                                      color: Color.fromARGB(255, 161, 161, 161),
                                    ),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Menu List Mockup Design',
                                          style: GoogleFonts.arima(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'List of menus with attractive designs for your business. I made it using Corel Draw. Created on 18/10/2023.',
                                          style: GoogleFonts.arima(
                                            fontSize: 10,
                                            color:
                                                (Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Color.fromARGB(
                                                        225, 25, 25, 25)
                                                    : Colors.white70),
                                          ),
                                          textScaleFactor:
                                              ScaleSize.textScaleFactor(
                                                  context),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Wrap(
                                            alignment: WrapAlignment.center,
                                            spacing: 5,
                                            runSpacing: 5,
                                            children: <Widget>[
                                              Container(
                                                height: 30,
                                                width: 130,
                                                child: AnimatedButton(
                                                  duration: 1,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.file_open_rounded,
                                                        size: 17,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        'Show Design',
                                                        style:
                                                            GoogleFonts.arima(
                                                          fontSize: 12,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                MenuListMockupDesign()));
                                                  },
                                                  type: null,
                                                  isOutline: true,
                                                  borderColor: Color.fromARGB(
                                                      255, 0, 68, 5),
                                                  borderWidth: 1,
                                                  height: 30,
                                                  width: 130,
                                                  borderRadius: 22.5,
                                                  color: Color.fromARGB(
                                                      255, 9, 177, 17),
                                                  shadowColor: Color.fromARGB(
                                                      255, 0, 115, 5),
                                                ),
                                              ),
                                            ],
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
                        Container(
                          width: 500,
                          child: Column(
                            children: <Widget>[
                              FittedBox(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  child: Image.asset(
                                    'assets/content_projects/content3_projects.png',
                                    width: 500,
                                    height: 352,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Color.fromARGB(255, 169, 157, 203),
                                    ),
                                    right: BorderSide(
                                      color: Color.fromARGB(255, 169, 157, 203),
                                    ),
                                    bottom: BorderSide(
                                      color: Color.fromARGB(255, 169, 157, 203),
                                    ),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Booth Mockup Design',
                                          style: GoogleFonts.arima(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'Beautiful and attractive mockup design for promotional needs. I made it using Corel Draw. Created on 02/11/2023.',
                                          style: GoogleFonts.arima(
                                            fontSize: 10,
                                            color:
                                                (Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Color.fromARGB(
                                                        225, 25, 25, 25)
                                                    : Colors.white70),
                                          ),
                                          textScaleFactor:
                                              ScaleSize.textScaleFactor(
                                                  context),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Wrap(
                                            alignment: WrapAlignment.center,
                                            spacing: 5,
                                            runSpacing: 5,
                                            children: <Widget>[
                                              Container(
                                                height: 30,
                                                width: 130,
                                                child: AnimatedButton(
                                                  duration: 1,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.file_open_rounded,
                                                        size: 17,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        'Show Design',
                                                        style:
                                                            GoogleFonts.arima(
                                                          fontSize: 12,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                BoothMockup()));
                                                  },
                                                  type: null,
                                                  isOutline: true,
                                                  borderColor: Color.fromARGB(
                                                      255, 0, 68, 5),
                                                  borderWidth: 1,
                                                  height: 30,
                                                  width: 130,
                                                  borderRadius: 22.5,
                                                  color: Color.fromARGB(
                                                      255, 9, 177, 17),
                                                  shadowColor: Color.fromARGB(
                                                      255, 0, 115, 5),
                                                ),
                                              ),
                                            ],
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
                        Container(
                          width: 500,
                          child: Column(
                            children: <Widget>[
                              FittedBox(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  child: Image.asset(
                                    'assets/content_projects/content5_projects.png',
                                    width: 500,
                                    height: 352,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Color.fromARGB(255, 166, 166, 166),
                                    ),
                                    right: BorderSide(
                                      color: Color.fromARGB(255, 166, 166, 166),
                                    ),
                                    bottom: BorderSide(
                                      color: Color.fromARGB(255, 166, 166, 166),
                                    ),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Website Madaniplash',
                                          style: GoogleFonts.arima(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'This is a website for a client, namely Madaniplash, a company engaged in the injection and blowing of HDPE and LDPE plastic. This is a project resulting from my field work practice while at Ajak Online. I made it using WordPress. Created on 30/01/2024.',
                                          style: GoogleFonts.arima(
                                            fontSize: 10,
                                            color:
                                                (Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Color.fromARGB(
                                                        225, 25, 25, 25)
                                                    : Colors.white70),
                                          ),
                                          textScaleFactor:
                                              ScaleSize.textScaleFactor(
                                                  context),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Wrap(
                                            alignment: WrapAlignment.center,
                                            spacing: 5,
                                            runSpacing: 5,
                                            children: <Widget>[
                                              Container(
                                                height: 30,
                                                width: 130,
                                                child: AnimatedButton(
                                                  duration: 1,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.open_in_browser,
                                                        size: 17,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        'Demo Project',
                                                        style:
                                                            GoogleFonts.arima(
                                                          fontSize: 12,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  onTap: () {
                                                    launch(
                                                        'https://madaniplast.com/');
                                                  },
                                                  type: null,
                                                  isOutline: true,
                                                  borderColor: Color.fromARGB(
                                                      255, 0, 68, 5),
                                                  borderWidth: 1,
                                                  height: 30,
                                                  width: 130,
                                                  borderRadius: 22.5,
                                                  color: Colors
                                                      .lightBlueAccent.shade700,
                                                  shadowColor:
                                                      Colors.blue.shade900,
                                                ),
                                              ),
                                            ],
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
                        Container(
                          width: 500,
                          child: Column(
                            children: <Widget>[
                              FittedBox(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                child: Image.asset(
                                  'assets/content_projects/content6_projects.png',
                                  width: 500,
                                  height: 352,
                                ),
                              )),
                              Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Color.fromARGB(255, 148, 185, 255),
                                    ),
                                    right: BorderSide(
                                      color: Color.fromARGB(255, 148, 185, 255),
                                    ),
                                    bottom: BorderSide(
                                      color: Color.fromARGB(255, 148, 185, 255),
                                    ),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Website Prim Research',
                                          style: GoogleFonts.arima(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'PRIM Market & Social Research is a social research institute and marketing study center that provides services. This is a project resulting from my field work practice while at Ajak Online. I made it using WordPress. Created on 01/02/2024.',
                                          style: GoogleFonts.arima(
                                            fontSize: 10,
                                            color:
                                                (Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Color.fromARGB(
                                                        225, 25, 25, 25)
                                                    : Colors.white70),
                                          ),
                                          textScaleFactor:
                                              ScaleSize.textScaleFactor(
                                                  context),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Wrap(
                                            alignment: WrapAlignment.center,
                                            spacing: 5,
                                            runSpacing: 5,
                                            children: <Widget>[
                                              Container(
                                                height: 30,
                                                width: 130,
                                                child: AnimatedButton(
                                                  duration: 1,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.open_in_browser,
                                                        size: 17,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        'Demo Project',
                                                        style:
                                                            GoogleFonts.arima(
                                                          fontSize: 12,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  onTap: () {
                                                    launch(
                                                        'https://primresearch.com/');
                                                  },
                                                  type: null,
                                                  isOutline: true,
                                                  borderColor: Color.fromARGB(
                                                      255, 0, 68, 5),
                                                  borderWidth: 1,
                                                  height: 30,
                                                  width: 130,
                                                  borderRadius: 22.5,
                                                  color: Colors
                                                      .lightBlueAccent.shade700,
                                                  shadowColor:
                                                      Colors.blue.shade900,
                                                ),
                                              ),
                                            ],
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
            ),
          ],
          footer: Footer(
            backgroundColor: Colors.transparent,
            child: Text(
              'Copyright © 2023 Rifal Anandika. All rights reserved.',
              style: GoogleFonts.arima(
                fontSize: 12,
                color: (Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white),
              ),
            ),
          ),
          flex: 10,
        ),
      ),
    );
  }
}
