import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:talebnet/website.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  List<Color> themeColors = [
        Color(0xFFDE741C),
    Color(0xFFDE741E),



  ];
  int _trigger = 0;
  Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      changeColor();
    });
    super.initState();
  }

  Future<void> changeColor() async {
    if (_trigger == colors.length - 1) {
      setState(() {
        _trigger = 0;

        themeColors = [colors[_trigger], colors[_trigger + 1]];
        _trigger += 2;
      });
    } else {
      setState(() {
        themeColors = [colors[_trigger], colors[_trigger + 1]];
        _trigger += 2;
      });
    }
  }

  List<Color> colors = [
    Color(0xFF1c1b4d),
    Color(0xFF593E67),
    Color(0xFFB85B56),
    Color(0xFF0C5776),
    Color(0xFF9A2C47),
    Color(0xFFEFABAA),
    Color(0xFF032E22),
    Color(0xFF833318),
    Color(0xFFD45714),
    Color(0xFF100D1F),
    Color(0xFFFF4F32),
    Color(0xFF6125FA),
    Color(0xFF002AFF),
    Color(0xFF911E4F),
    Color(0xFFEB6981),
    Color(0xFFEFD9CA),
    Color(0xFF341E83),
    Color(0xFF3C50FF),
    Color(0xFFE72F5B),
    Color(0xFFFC93F2),
    Color(0xFF5EB670),
    Color(0xFF406B15),
    Color(0xFF9AAE09),
    Color(0xFF031B62),
    Color(0xFFD1D1D1),
    Color(0xFF0050BC),
    Color(0xFF24383C),
    Color(0xFFC7ABE1),
    Color(0xFFDFCEBC),
    Color(0xFFDE741C),
    Color(0xFFDE741E),
  ];
  int position = 0;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    return SafeArea(
      child: AnimatedContainer(
          duration: Duration(seconds: 3),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: themeColors,
          )),
          child: Scaffold(
              floatingActionButton: BoomMenu(
                backgroundColor: Colors.indigoAccent,
                foregroundColor: Colors.white,
                animatedIcon: AnimatedIcons.menu_close,

                animatedIconTheme: IconThemeData(size: 22.0),
                //child: Icon(Icons.add),
                onOpen: () => print('OPENING DIAL'),
                onClose: () => print('DIAL CLOSED'),
                scrollVisible: true,
                overlayColor: Colors.transparent,
                overlayOpacity: 0,
                children: [
                  MenuItem(
                    child: Icon(Icons.call, color: Colors.white),
                    title: "Contactez-nous",
                    titleColor: Colors.white,
                    subtitle: "Vous pouvez contactez-nous via",
                    subTitleColor: Colors.white,
                    backgroundColor: Colors.blueGrey,
                    onTap: () => print('FIRST CHILD'),
                  ),
                  MenuItem(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.facebook.com/images/fb_icon_325x325.png'),
                    ),
                    title: "Facebook",
                    titleColor: Colors.white,
                    subtitle: "",
                    subTitleColor: Colors.white,
                    backgroundColor: Colors.deepOrange,
                    onTap: () => print('FIRST CHILD'),
                  ),
                  MenuItem(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.pngfind.com/pngs/m/91-911335_png-telegram-transparent-png.png'),
                    ),
                    title: "Telegram",
                    titleColor: Colors.white,
                    subtitle: "",
                    subTitleColor: Colors.white,
                    backgroundColor: Colors.green,
                    onTap: () => print('SECOND CHILD'),
                  ),
                  MenuItem(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/LinkedIn_logo_initials.png/768px-LinkedIn_logo_initials.png'),
                    ),
                    title: "LinkedIn",
                    titleColor: Colors.white,
                    subtitle: "",
                    subTitleColor: Colors.white,
                    backgroundColor: Colors.blue,
                    onTap: () => print('THIRD CHILD'),
                  ),
                  // MenuItem(
                  //   child: Icon(Icons.ac_unit, color: Colors.black),
                  //   title: "Profiles",
                  //   titleColor: Colors.white,
                  //   subtitle: "",
                  //   subTitleColor: Colors.white,
                  //   backgroundColor: Colors.blue,
                  //   onTap: () => print('FOURTH CHILD'),
                  // )
                ],
              ),
              backgroundColor: Colors.transparent,
              body: IntroductionScreen(
                  curve: Curves.easeIn,
                  globalBackgroundColor: Colors.transparent,
                  done: SizedBox(),
                  pages: [
                    // MODEL 1
                    PageViewModel(
                      image: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) =>
                                  Website('https://www.talebnet.com')));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Lottie.asset('assets/karrousa.json',
                                  ),
                            ),
                          ),
                        ),
                      ),
                      bodyWidget: SizedBox(),
                      titleWidget: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) =>
                                  Website('https://www.talebnet.com')));
                        },
                        child: Text("Boutique TalebNet",
                            style: GoogleFonts.muli(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white)),
                      ),
                    ),
                    // MODEL 2
                    PageViewModel(
                      image: InkWell(
                        //                         onTap: () {
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (_) =>
                        //           Website('https://www.youtube.com')));
                        // },
                                              child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Lottie.asset(
                                'assets/search.json',
                              ),
                            ),
                          ),
                        ),
                      ),
                      bodyWidget: Text("Slogant",
                            style: GoogleFonts.muli(
                              
                                fontSize: 25,
                                color: Colors.white)),
                      titleWidget: InkWell(
                        //                         onTap: () {
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (_) =>
                        //           Website('https://khedma.saf9a.tn')));
                        // },
                                              child: Text("Khedma",
                            style: GoogleFonts.muli(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white)),
                      ),
                    ),
                    // MODEL 3
                    PageViewModel(
                      image: InkWell(
                        //                         onTap: () {
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (_) =>
                        //           Website('https://khedma.saf9a.tn')));
                        // },
                                              child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Lottie.asset('assets/slm.json',
                                  ),
                            ),
                          ),
                        ),
                      ),
                      bodyWidget: Text("بيع و اشري و أعمل افاريات",
                            style: GoogleFonts.muli(
                              
                                fontSize: 25,
                                color: Colors.white)),
                      titleWidget: InkWell(
                        //                         onTap: () {
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (_) =>
                        //           Website('https://www.instagram.com')));
                        // },
                                              child: Text("Saf9a",
                            style: GoogleFonts.muli(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white)),
                      ),
                    ),
                  ],
                  onDone: () {
                    // When done button is press
                  },
                  dotsDecorator: const DotsDecorator(
                    size: Size(3.5, 7),
                    color: Color(0xFFBDBDBD),
                    activeSize: Size(22.0, 10.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                  )))),
    );
  }
}
