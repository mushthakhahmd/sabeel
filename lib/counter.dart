import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  _counterState createState() => _counterState();
}

class _counterState extends State<CounterView> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      print(_counter);
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
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
        title: Text(
          'counter'.tr(),
          style: TextStyle(color: Colors.black),
        ),
        elevation: .2,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .66,
              "assets/other/counter_new.png",
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 280,
              //right: 0,
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width * .7,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    _counter.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 200,
              right: 80,
              child: InkWell(
                onTap: () {
                  _counter = 0;
                  print(_counter);
                  setState(() {});
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Center(
                    child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade700,
                            shape: BoxShape.circle)),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              child: GestureDetector(
                onTap: () {
                  _incrementCounter();
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Center(
                    child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
