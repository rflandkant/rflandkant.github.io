import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:google_fonts/google_fonts.dart';

class BoothMockup extends StatelessWidget {
  const BoothMockup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Boot Mockup Design',
          style: GoogleFonts.arima(
            fontSize: 45,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              color: const Color.fromARGB(0, 255, 255, 255),
            ),
          ),
        ),
        toolbarHeight: 70,
      ),
      body: FooterView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 120, bottom: 50),
            child: Wrap(
              spacing: 50,
              runSpacing: 50,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1 / 3,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/design/mockup_booth_makanan_1.png',
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1 / 3,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/design/mockup_booth_makanan_2.png',
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1 / 3,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/design/mockup_booth_minuman_1.png',
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1 / 3,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/design/mockup_booth_minuman_2.png',
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1 / 3,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/design/mockup_booth_minuman_3.png',
                        fit: BoxFit.cover,
                      )),
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
    );
  }
}

//-------------------------------------------------------------------------------------------------------------

class MenuListMockupDesign extends StatelessWidget {
  const MenuListMockupDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Menu List Mockup Design',
          style: GoogleFonts.arima(
            fontSize: 45,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              color: const Color.fromARGB(0, 255, 255, 255),
            ),
          ),
        ),
        toolbarHeight: 70,
      ),
      body: FooterView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 120, bottom: 50),
            child: Wrap(
              spacing: 50,
              runSpacing: 50,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1 / 3,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/design/menu_laminating_1.png',
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1 / 3,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/design/menu_laminating_2.png',
                        fit: BoxFit.cover,
                      )),
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
    );
  }
}
