import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sabeel/home.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   loadAppConfiguration(context);
  // }

  @override
  void initState() {
    super.initState();
    loadAppConfiguration(context);

  }


  Future<void> loadAppConfiguration(BuildContext context) async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
    
     
          
    Timer(const Duration(seconds: 1), () {
       Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const home_page()));

    })
    
    ;
    
    });
  }

  @override
  Widget build(BuildContext context) {

  
    return SafeArea(
      child: Scaffold(
          body:

          Container(
          //    constraints: BoxConstraints.expand(),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/cover.png"), fit: BoxFit.cover)),
          ),

          ),
    );
  }
}
