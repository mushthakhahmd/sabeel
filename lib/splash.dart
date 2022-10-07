import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sabeel/home.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const home_page()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body:

        // Center(
        //   child:
        //   Container(
        //     constraints: BoxConstraints.expand(),
        //     decoration: BoxDecoration(
        //         image: DecorationImage(
        //             image: AssetImage("assets/cover.jpg"), fit: BoxFit.cover)),
        //   ),
        // ),

        );
  }
}
