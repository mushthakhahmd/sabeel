import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sabeel/constant.dart';
import 'package:sabeel/counter.dart';
import 'package:sabeel/db/db_function.dart';
import 'package:sabeel/model/item_model.dart';
import 'package:sabeel/views/pdf_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabeel/items.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    DateTime? clickTime;
    return WillPopScope(
      onWillPop: () {
        if (_currentIndex == 0) {
          final DateTime now = DateTime.now();

          if (clickTime == null ||
              now.difference(clickTime!) > const Duration(seconds: 2)) {
            clickTime = now;

            Fluttertoast.showToast(
              msg: "Press double tap to exit",
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: Colors.black,
            );
            return Future.value(false);
          } else {
            //Fluttertoast.cancel();
            return Future.value(true);
          }
        }

        _currentIndex = 0;
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        drawer: Drawer(
          child: SafeArea(
            child: Column(
              children: const [
                SizedBox(
                  height: 25,
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Color(0xff1D438A),
                  ),
                  title: Text(
                    "Home",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(
                  color: Colors.black26,
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle_rounded,
                    color: Color(0xff1D438A),
                  ),
                  title: Text(
                    "Profile",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(
                  color: Colors.black26,
                ),
                ListTile(
                  leading: Icon(
                    Icons.category,
                    color: Color(0xff1D438A),
                  ),
                  title: Text(
                    "Category",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(
                  color: Colors.black26,
                ),
                ListTile(
                  leading: Icon(
                    Icons.assistant_navigation,
                    color: Color(0xff1D438A),
                  ),
                  title: Text(
                    "Qibla Finder",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(
                  color: Colors.black26,
                ),
                ListTile(
                  leading: Icon(
                    Icons.notifications_none,
                    color: Color(0xff1D438A),
                  ),
                  title: Text(
                    "Notifications",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(
                  color: Colors.black26,
                ),
                ListTile(
                  leading: Icon(
                    Icons.share,
                    color: Color(0xff1D438A),
                  ),
                  title: Text(
                    "Share",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: [
          CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 10.10,
                toolbarHeight: 60,
                title: Text(
                  "Sabeel_ul Falah",
                  style: GoogleFonts.abel(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.normal),
                ),
                centerTitle: true,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      gradient: LinearGradient(
                          colors: [Colors.white, Colors.white],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                ),
                leading: Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(
                      Icons.view_headline_outlined,
                      color: Color(0xff1D438A),
                      size: 28,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
                systemOverlayStyle: SystemUiOverlayStyle.light,
              ),
              SliverList(
                  delegate: SliverChildListDelegate(
                [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    width: 330,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white),
                                    child: Center(
                                      child: TextField(
                                        textAlign: TextAlign.left,
                                        cursorColor: Colors.black45,
                                        onTap: () {
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const item_list_wakeup(
                                                cat_id: -1,
                                              ),
                                            ),
                                          );
                                        },
                                        decoration: InputDecoration(
                                          focusColor: Colors.blue,
                                          prefixIcon: Icon(Icons.search),
                                          hintText: "Search by Title",
                                          hintStyle: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 18),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Row(
                            children: [
                              Text(
                                "Categories",
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    color: const Color(0xff3F414E),
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ), //catagories
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const item_list_wakeup(
                                                  cat_id: 1,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height:
                                                130, //MediaQuery.of(content).size.height,
                                            width: 90,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/shape.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: 32,
                                                  height: 32,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/thahajjud.png"),
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  child: Text(
                                                    "أوراد التهجد",
                                                    style: GoogleFonts.cairo(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Upon Wakeup &",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14.5,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Tahajjud Adkar",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                              const SizedBox(
                                width: 15,
                              ),
                              Row(children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const item_list_wakeup(
                                                            cat_id: 2)));
                                          },
                                          child: Container(
                                            height:
                                                130, //MediaQuery.of(content).size.height,
                                            width: 90,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/shape.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: 32,
                                                  height: 36,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/fajr1.png"),
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Container(
                                                  child: Text(
                                                    "أوراد الفجر",
                                                    style: GoogleFonts.cairo(
                                                        fontSize: 14.5,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Adkar of Fajr",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "  ",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ]),
                              const SizedBox(
                                width: 15,
                              ),
                              Row(children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const item_list_wakeup(
                                                            cat_id: 3)));
                                          },
                                          child: Container(
                                            height:
                                                130, //MediaQuery.of(content).size.height,
                                            width: 90,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/shape.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: 32,
                                                  height: 36,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/dikr.png"),
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  child: Text(
                                                    "أذكار بعد",
                                                    style: GoogleFonts.cairo(
                                                        fontSize: 14.5,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "الصلوات",
                                                    style: GoogleFonts.cairo(
                                                        fontSize: 14.5,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Adkar After",
                                            style: GoogleFonts.blinker(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Five Prayers",
                                            style: GoogleFonts.blinker(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                            ]),
                        const SizedBox(
                          height: 10,
                        ), //1st row
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const item_list_wakeup(
                                                            cat_id: 4)));
                                          },
                                          child: Container(
                                            height:
                                                130, //MediaQuery.of(content).size.height,
                                            width: 90,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/shape.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: 32,
                                                  height: 36,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/dhuha1.png"),
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 0),
                                                  child: Container(
                                                    child: Text(
                                                      "أوراد الضحى",
                                                      style: GoogleFonts.cairo(
                                                          fontSize: 14.5,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Adkar Dhuha",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "  ",
                                            style: GoogleFonts.blinker(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                              const SizedBox(
                                width: 15,
                              ),
                              Row(children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const item_list_wakeup(
                                                            cat_id: 5)));
                                          },
                                          child: Container(
                                            height:
                                                130, //MediaQuery.of(content).size.height,
                                            width: 90,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/shape.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: 32,
                                                  height: 36,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/duhr.png"),
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  child: Text(
                                                    "أوراد الظهر",
                                                    style: GoogleFonts.cairo(
                                                        fontSize: 14.5,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Adkar Luhr",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "  ",
                                            style: GoogleFonts.blinker(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                              const SizedBox(
                                width: 15,
                              ),
                              Row(children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const item_list_wakeup(
                                                            cat_id: 6)));
                                          },
                                          child: Container(
                                            height:
                                                130, //MediaQuery.of(content).size.height,
                                            width: 90,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/shape.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: 32,
                                                  height: 36,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/asr1.png"),
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  child: Text(
                                                    "أوراد العصر",
                                                    style: GoogleFonts.cairo(
                                                        fontSize: 14.5,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Adkar Asr",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "   ",
                                            style: GoogleFonts.blinker(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                            ]),

                        ///2nd row
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const item_list_wakeup(
                                                            cat_id: 7)));
                                          },
                                          child: Container(
                                            height:
                                                130, //MediaQuery.of(content).size.height,
                                            width: 90,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/shape.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: 32,
                                                  height: 36,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/magrib1.png"),
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 0),
                                                  child: Container(
                                                    child: Text(
                                                      "أوراد المغرب",
                                                      style: GoogleFonts.cairo(
                                                          fontSize: 14.5,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Adkar Magrib",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "   ",
                                            style: GoogleFonts.roboto(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                              const SizedBox(
                                width: 15,
                              ),
                              Row(children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const item_list_wakeup(
                                                            cat_id: 8)));
                                          },
                                          child: Container(
                                            height:
                                                130, //MediaQuery.of(content).size.height,
                                            width: 90,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/shape.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 26,
                                                ),
                                                Container(
                                                  width: 28,
                                                  height: 32,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/surah.png"),
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "السور لكل",
                                                    style: GoogleFonts.cairo(
                                                        fontSize: 14.5,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "يوم",
                                                    style: GoogleFonts.cairo(
                                                        fontSize: 14.5,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Daily Surah",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "  ",
                                            style: GoogleFonts.roboto(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                              const SizedBox(
                                width: 15,
                              ),
                              Row(children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const item_list_wakeup(
                                                            cat_id: 9)));
                                          },
                                          child: Container(
                                            height:
                                                130, //MediaQuery.of(content).size.height,
                                            width: 90,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/shape.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: 32,
                                                  height: 36,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/isha1.png"),
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Container(
                                                  child: Text(
                                                    "أوراد العشاء",
                                                    style: GoogleFonts.cairo(
                                                        fontSize: 14.5,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Adkar Isha",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "   ",
                                            style: GoogleFonts.blinker(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                            ]),

                        //3rd row
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const item_list_wakeup(
                                                            cat_id: 10)));
                                          },
                                          child: Container(
                                            height:
                                                130, //MediaQuery.of(content).size.height,
                                            width: 90,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/shape.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: 32,
                                                  height: 36,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/bed.png"),
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "أذكار قبل",
                                                    style: GoogleFonts.cairo(
                                                        fontSize: 14.5,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "النوم",
                                                    style: GoogleFonts.cairo(
                                                        fontSize: 14.5,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Adkar Before",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Sleep",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                              const SizedBox(
                                width: 15,
                              ),
                              Row(children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const item_list_wakeup(
                                                            cat_id: 11)));
                                          },
                                          child: Container(
                                            height:
                                                130, //MediaQuery.of(content).size.height,
                                            width: 90,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/shape.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: 32,
                                                  height: 36,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/jumua.png"),
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "أذكار يوم",
                                                    style: GoogleFonts.cairo(
                                                        fontSize: 14.5,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "الجمعة",
                                                    style: GoogleFonts.cairo(
                                                        fontSize: 14.5,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Adkar of",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Friday",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                              const SizedBox(
                                width: 15,
                              ),
                              Row(children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const item_list_wakeup(
                                                            cat_id: 12)));
                                          },
                                          child: Container(
                                            height:
                                                130, //MediaQuery.of(content).size.height,
                                            width: 90,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/shape.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: 32,
                                                  height: 36,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/muslim.png"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "يوم المسلم",
                                                    style: GoogleFonts.cairo(
                                                        fontSize: 14.5,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "(سنة)",
                                                    style: GoogleFonts.cairo(
                                                        fontSize: 14.5,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Day of Muslim",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "(Sunnah)",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                            ]), //4th row
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const item_list_wakeup(
                                                            cat_id: 13)));
                                          },
                                          child: Container(
                                            height:
                                                130, //MediaQuery.of(content).size.height,
                                            width: 90,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/shape.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: 32,
                                                  height: 36,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/dalaelul.png"),
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 0),
                                                  child: Container(
                                                    child: Text(
                                                      "دلائل الخيرات",
                                                      style: GoogleFonts.cairo(
                                                          fontSize: 14.5,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 5),
                                                  child: Container(
                                                    child: Text(
                                                      "والصلوات",
                                                      style: GoogleFonts.cairo(
                                                          fontSize: 14.5,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Dalaelul Khairath",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "and Swalath",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                              const SizedBox(
                                width: 15,
                              ),
                              Row(children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const item_list_wakeup(
                                                            cat_id: 14)));
                                          },
                                          child: Container(
                                            height:
                                                130, //MediaQuery.of(content).size.height,
                                            width: 90,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/shape.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: 36,
                                                  height: 36,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/moulid.png"),
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5),
                                                  child: Container(
                                                    child: Text(
                                                      "الموالد",
                                                      style: GoogleFonts.cairo(
                                                          fontSize: 14.5,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Moulid",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "",
                                            style: GoogleFonts.roboto(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                              const SizedBox(
                                width: 15,
                              ),
                              Row(children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const item_list_wakeup(
                                                            cat_id: 15)));
                                          },
                                          child: Container(
                                            height:
                                                130, //MediaQuery.of(content).size.height,
                                            width: 90,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/shape.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: 32,
                                                  height: 36,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/quran.png"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  child: Container(
                                                    child: Text(
                                                      "القصائد",
                                                      style: GoogleFonts.cairo(
                                                          fontSize: 14.5,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Qaseeda",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "",
                                            style: GoogleFonts.roboto(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                            ]), //5th row
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const item_list_wakeup(
                                                            cat_id: 15)));
                                          },
                                          child: Container(
                                            height:
                                                130, //MediaQuery.of(content).size.height,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/shape.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: 36,
                                                  height: 36,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/spday.png"),
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  child: Text(
                                                    "أذكار الأيام",
                                                    style: GoogleFonts.cairo(
                                                        fontSize: 14.5,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "الفاضلة",
                                                    style: GoogleFonts.cairo(
                                                        fontSize: 14.5,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Special Days",
                                            style: GoogleFonts.roboto(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Adkar",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                              SizedBox(
                                width: 15,
                              ),
                              Row(children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const item_list_wakeup(
                                                            cat_id: 15)));
                                          },
                                          child: Container(
                                            height:
                                                130, //MediaQuery.of(content).size.height,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/shape.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  width: 32,
                                                  height: 36,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/travel.png"),
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5),
                                                  child: Container(
                                                    child: Text(
                                                      "أذكار السفر",
                                                      style: GoogleFonts.cairo(
                                                          fontSize: 14.5,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Adkar & Dua",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "For Travelling",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                              SizedBox(
                                width: 15,
                              ),
                              Row(children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const item_list_wakeup(
                                                            cat_id: 15)));
                                          },
                                          child: Container(
                                            height:
                                                130, //MediaQuery.of(content).size.height,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/shape.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: 32,
                                                  height: 36,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/mayyith.jpg"),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  child: Text(
                                                    "ما ينفع",
                                                    style: GoogleFonts.cairo(
                                                        fontSize: 14.5,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "للميت",
                                                    style: GoogleFonts.cairo(
                                                        fontSize: 14.5,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Which Benefits",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "For Mayyith",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                            ]), //6th row
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       Row(children: [
                        //         Column(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             Row(
                        //               children: [
                        //                 Container(
                        //                   height:
                        //                   130, //MediaQuery.of(content).size.height,
                        //                   width: 90,
                        //                   decoration: BoxDecoration(
                        //                     image: DecorationImage(
                        //                       image: AssetImage("assets/shape.png"),
                        //                       fit: BoxFit.cover,
                        //                     ),
                        //                   ),
                        //                   child: Column(
                        //                     mainAxisAlignment: MainAxisAlignment.center,
                        //                     children: [
                        //                       SizedBox(
                        //                         height: 20,
                        //                       ),
                        //                       Container(
                        //                         width: 32,
                        //                         height: 36,
                        //                         decoration: BoxDecoration(
                        //                           image: DecorationImage(
                        //                             image:
                        //                             AssetImage("assets/hajj.png"),
                        //                             fit: BoxFit.fitHeight,
                        //                           ),
                        //                         ),
                        //                       ),
                        //                       SizedBox(
                        //                         height: 5,
                        //                       ),
                        //                       Container(
                        //                         child: Text(
                        //                           "اذكار الحج",
                        //                           style: GoogleFonts.cairo(
                        //                               fontSize: 13,
                        //                               color: Colors.black,
                        //                               fontWeight: FontWeight.bold),
                        //                         ),
                        //                       ),
                        //                       Container(
                        //                         child: Text(
                        //                           "والعمرة",
                        //                           style: GoogleFonts.cairo(
                        //                               fontSize: 13,
                        //                               color: Colors.black,
                        //                               fontWeight: FontWeight.bold),
                        //                         ),
                        //                       )
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //             SizedBox(
                        //               height: 5,
                        //             ),
                        //             Row(
                        //               children: [
                        //                 Container(
                        //                   child: Text(
                        //                     "Hajj & Umrah",
                        //                     style: GoogleFonts.roboto(
                        //                         fontSize: 16,
                        //                         color: Colors.black,
                        //                         fontWeight: FontWeight.w600),
                        //                   ),
                        //                 )
                        //               ],
                        //             ),
                        //             Row(
                        //               children: [
                        //                 Container(
                        //                   child: Text(
                        //                     " ",
                        //                     style: GoogleFonts.roboto(
                        //                         fontSize: 16,
                        //                         color: Colors.black,
                        //                         fontWeight: FontWeight.w600),
                        //                   ),
                        //                 )
                        //               ],
                        //             )
                        //           ],
                        //         ),
                        //       ]),
                        //       SizedBox(
                        //         width: 20,
                        //       ),
                        //       Row(children: [
                        //         Column(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             Row(
                        //               children: [
                        //                 Container(
                        //                   height:
                        //                       130, //MediaQuery.of(content).size.height,
                        //                   width: 90,
                        //                   decoration: BoxDecoration(
                        //                     image: DecorationImage(
                        //                       image: AssetImage("assets/shape.png"),
                        //                       fit: BoxFit.cover,
                        //                     ),
                        //                   ),
                        //                   child: Column(
                        //                     mainAxisAlignment:
                        //                         MainAxisAlignment.center,
                        //                     children: [
                        //                       SizedBox(
                        //                         height: 20,
                        //                       ),
                        //                       Container(
                        //                         width: 32,
                        //                         height: 36,
                        //                         decoration: BoxDecoration(
                        //                           image: DecorationImage(
                        //                             image: AssetImage(
                        //                                 "assets/mahlarath.png"),
                        //                             fit: BoxFit.fitHeight,
                        //                           ),
                        //                         ),
                        //                       ),
                        //                       SizedBox(
                        //                         height: 5,
                        //                       ),
                        //                       Container(
                        //                         child: Text(
                        //                           "المحضرة",
                        //                           style: GoogleFonts.cairo(
                        //                               fontSize: 13,
                        //                               color: Colors.black,
                        //                               fontWeight: FontWeight.bold),
                        //                         ),
                        //                       ),
                        //                       Container(
                        //                         child: Text(
                        //                           "البدرية",
                        //                           style: GoogleFonts.cairo(
                        //                               fontSize: 13,
                        //                               color: Colors.black,
                        //                               fontWeight: FontWeight.bold),
                        //                         ),
                        //                       )
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //             SizedBox(
                        //               height: 5,
                        //             ),
                        //             Row(
                        //               children: [
                        //                 Container(
                        //                   child: Text(
                        //                     "Al Mahlarathul",
                        //                     style: GoogleFonts.roboto(
                        //                         fontSize: 16,
                        //                         color: Colors.black,
                        //                         fontWeight: FontWeight.w600),
                        //                   ),
                        //                 )
                        //               ],
                        //             ),
                        //             Row(
                        //               children: [
                        //                 Container(
                        //                   child: Text(
                        //                     "badriyya",
                        //                     style: GoogleFonts.roboto(
                        //                         fontSize: 16,
                        //                         color: Colors.black,
                        //                         fontWeight: FontWeight.w600),
                        //                   ),
                        //                 )
                        //               ],
                        //             )
                        //           ],
                        //         ),
                        //       ]),
                        //       SizedBox(
                        //         width: 20,
                        //       ),
                        //       Row(children: [
                        //         Column(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             Row(
                        //               children: [
                        //                 Container(
                        //                   height:
                        //                       130, //MediaQuery.of(content).size.height,
                        //                   width: 90,
                        //                   decoration: BoxDecoration(
                        //                     image: DecorationImage(
                        //                       image: AssetImage("assets/shape.png"),
                        //                       fit: BoxFit.cover,
                        //                     ),
                        //                   ),
                        //                   child: Column(
                        //                     mainAxisAlignment:
                        //                         MainAxisAlignment.center,
                        //                     children: [
                        //                       SizedBox(
                        //                         height: 20,
                        //                       ),
                        //                       Container(
                        //                         width: 32,
                        //                         height: 36,
                        //                         decoration: BoxDecoration(
                        //                           image: DecorationImage(
                        //                             image: AssetImage(
                        //                                 "assets/other.png"),
                        //                             fit: BoxFit.cover,
                        //                           ),
                        //                         ),
                        //                       ),
                        //                       SizedBox(
                        //                         height: 5,
                        //                       ),
                        //                       Container(
                        //                         child: Text(
                        //                           "أذكار لسائر",
                        //                           style: GoogleFonts.cairo(
                        //                               fontSize: 13,
                        //                               color: Colors.black,
                        //                               fontWeight: FontWeight.bold),
                        //                         ),
                        //                       ),
                        //                       Container(
                        //                         child: Text(
                        //                           "الأوقات",
                        //                           style: GoogleFonts.cairo(
                        //                               fontSize: 13,
                        //                               color: Colors.black,
                        //                               fontWeight: FontWeight.bold),
                        //                         ),
                        //                       )
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //             SizedBox(
                        //               height: 5,
                        //             ),
                        //             Row(
                        //               children: [
                        //                 Container(
                        //                   child: Text(
                        //                     "Adhkar On",
                        //                     style: GoogleFonts.roboto(
                        //                         fontSize: 16,
                        //                         color: Colors.black,
                        //                         fontWeight: FontWeight.w600),
                        //                   ),
                        //                 )
                        //               ],
                        //             ),
                        //             Row(
                        //               children: [
                        //                 Container(
                        //                   child: Text(
                        //                     "Other Occasions",
                        //                     style: GoogleFonts.roboto(
                        //                         fontSize: 16,
                        //                         color: Colors.black,
                        //                         fontWeight: FontWeight.w600),
                        //                   ),
                        //                 )
                        //               ],
                        //             )
                        //           ],
                        //         ),
                        //       ]),
                        //     ]), //7th row
                        SizedBox(
                          height: 20,
                        ), //7th row
                      ]),
                ],
              )),
            ],
          ),
          const FavView(),
          CounterView(),
          Container()
        ].elementAt(_currentIndex),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: Colors.purple,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(Icons.favorite_border),
              title: const Text("Saved"),
              selectedColor: Colors.pink,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Image.asset('assets/counter_icon.png', scale: 1.1),
              title: const Text("Counter"),
              selectedColor: Colors.orange,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}

class FavView extends StatefulWidget {
  const FavView({
    Key? key,
  }) : super(key: key);

  @override
  State<FavView> createState() => _FavViewState();
}

class _FavViewState extends State<FavView> {
  @override
  void initState() {
    super.initState();

    getFavItems();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 330,
              ),
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const home_page()));
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xff1D438A),
                        size: 24,
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SpaceBar(),
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: itemsNotifier,
                  builder:
                      (BuildContext ctx, List<Items> items, Widget? child) {
                    return ListView.builder(
                      itemCount: itemsNotifier.value.length,
                      shrinkWrap: true,
                      itemBuilder: (itemBuilder, index) {
                        final item = itemsNotifier.value[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<dynamic>(
                                builder: (_) => PdfViewPage(
                                  path: item.imgUrl,
                                  pageHeader: item.title,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ListTile(
                                leading: SizedBox(
                                    height: 50.0,
                                    width: 50.0, // fixed width and height
                                    child: Image.asset("list.png")),
                                title: Text(
                                  item.title,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                subtitle: Text(
                                  item.subTitle,
                                  style: const TextStyle(
                                      color: Colors.black87, fontSize: 16),
                                ),
                                trailing: Padding(
                                  padding: const EdgeInsets.only(bottom: 25),
                                  child: Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(
                                              0.5), //color of shadow
                                          spreadRadius:
                                              0.5, //spread radius// blur radius
                                          // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: FavoriteButton(
                                      iconSize: 24,
                                      isFavorite: item.isFavorite,
                                      // iconDisabledColor: Colors.white,
                                      valueChanged: (_isFavorite) async {
                                        await updateFavorite(
                                            item.id, _isFavorite.toString());
                                        print('Is Favorite : $_isFavorite');
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
