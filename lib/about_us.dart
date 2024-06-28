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
        body: SingleChildScrollView(
            child:Column(children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 320, top: 20),
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
              child: Text(
                'ABOUT US',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 20, height: 1.5, fontWeight: FontWeight.w500),
              )),
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Welcome to Sabeel ul-Falah, your comprehensive companion for daily Islamic practices and spiritual growth. Our app is designed to help you integrate the beautiful traditions of Islam into your daily life with ease and convenience.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, height: 1.5),
              )),
              const SizedBox(height: 10,),
          Container(
              child: Text(
                'Features:',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, height: 1.5, fontWeight:FontWeight.w400),
              )),
              Container( padding: EdgeInsets.all(10),child:
              DefaultTextStyle.merge(
                style: TextStyle(fontSize: 16, fontWeight:FontWeight.w300),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start ,
                    children: [
                      Text('Daily Azkar: Access a curated collection of azkar to start and end your day with spiritual mindfulness.'), const SizedBox(height: 5,),
                      Text('Surahs: Read and Think to Quran and selected Surahs from the Quran, enhancing your recitation and understanding.'), const SizedBox(height: 5,),
                      Text('How a Day of a Muslim Should Be: Discover guidelines and tips on structuring your day according to Islamic principles, ensuring a balanced and spiritually fulfilling routine.'), const SizedBox(height: 5,),
                      Text('Salah (Prayer) Guide: Get detailed information on the different types of Salah, including obligatory prayers, Sunnah, and Nafl prayers. Also specified Zikr after it.'), const SizedBox(height: 5,),
                      Text('Qaseeda: Enjoy a collection of Qaseedas, beautiful Islamic poems and hymns, to inspire and uplift your spirit.'),  const SizedBox(height: 5,),
                      Text('Moulid: Celebrate the life of the Prophet Muhammad (PBUH) with access to various Moulid recitations and readings. Added with some other Great Scholars Moulid.'),  const SizedBox(height: 5,),
                      Text('Personalized Reminders: Set custom reminders for your daily azkar and prayers, ensuring you never miss an important moment of worship.'),  const SizedBox(height: 5,),
                      Text('Tasbeeh Counter: Use our digital tasbeeh counter to keep track of your dhikr effortlessly.'),  const SizedBox(height: 5,),
                      Text('Duas and Supplications: Explore a comprehensive library of duas for various occasions and needs.'),  const SizedBox(height: 5,),
                      Text('Educational Content: Learn about the significance and benefits of different azkar, Surahs, and Islamic practices through our informative collection with resources.'),  const SizedBox(height: 5,),
                      Text('At Sabeel ul-Falah, our mission is to provide a user-friendly platform that encourages and supports your spiritual growth. Whether you are at home, work, or on the go, our app is here to help you stay connected to your faith.'),  const SizedBox(height: 5,),
                      Text('Download Sabeel ul-Falah today and embark on a journey of spiritual enrichment and peace.'),   const SizedBox(height: 25,),
                      Text('Contact Us:  +91 7902299386, mushthakh313@gmail.com'),const SizedBox(height: 10,),
                      Text('We value your feedback and suggestions. If you have any questions or need assistance, please Contact Us.'),
                      Text(''),
                    ]
                ),
              ))
              // Container(
              //     padding: EdgeInsets.all(10),
              //     child: Text(
              //
              //           ''
              //           ''
              //           ''
              //           ''
              //           ''
              //           ''
              //           ''
              //           ''
              //           ''
              //           ''
              //           '',
              //       textAlign: TextAlign.start,
              //       style: TextStyle(
              //           fontSize: 16, height: 1.5, fontWeight: FontWeight.w400),
              //     )),

        ]),
        ),
      ),
    );
  }
}
