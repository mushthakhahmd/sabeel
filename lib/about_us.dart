import 'package:flutter/material.dart';
import 'package:sabeel/home.dart';

class about_us extends StatefulWidget {
  const about_us({Key? key}) : super(key: key);

  @override
  State<about_us> createState() => _about_usState();
}

class _about_usState extends State<about_us> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
            children: [
        Container(
          child: Padding(
          padding: const EdgeInsets.only(
              right: 320,top: 20
          ),
          child: Container(
            height: 36,
            width: 36,
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
        ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text('ABOUT US'
                    , textAlign: TextAlign.justify,style: TextStyle(fontSize: 20,height: 1.5,fontWeight: FontWeight.w500),  )
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                    '                     This application named "Sebeelul Falah" in front of you is the result of two years of effort by the students of the Sadath Academy under the Madin Academy, which trains only AhluBayt progeny. Similarly, this app prepares you the path to success. It includes more than 300 items in 18 parts like Dhikrs, Duas, Aurads, Mawlids etc. that a Muslim needs in his life. You have in your hands English and Arabic version of this app which is different from others like Muslims One Day Favorite Button etc. Although it was released after several edits, it will indicate any errors that come to your attention.'
                      , textAlign: TextAlign.justify,style: TextStyle(fontSize: 16,height: 1.5),  )
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text('Contact: Sayyid Mohammed Savad 7902299386'
                    , textAlign: TextAlign.justify,style: TextStyle(fontSize: 16,height: 1.5),  )
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text('Creator: Sayyid Mushthakh Al-Bafaqhi'
                    , textAlign: TextAlign.start,style: TextStyle(fontSize: 16,height: 1.5, fontWeight: FontWeight.w400),  )
              ),
      ]
      ),
    ),
    );
  }
}
