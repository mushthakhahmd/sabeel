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
          "Counter",
          style: TextStyle(color: Colors.black),
        ),
        elevation: .2,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/counter_home.png"),
            Positioned(
              bottom: 280,
              //right: 0,
              child: Text(
                _counter.toString(),
                textAlign: TextAlign.center,
                textScaleFactor: 3.5,
              ),
            ),
            Positioned(
              bottom: 190,
              right: 50,
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
              bottom: 50,
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
