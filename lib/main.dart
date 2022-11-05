import 'package:ecommerce/pages/Loginpage.dart';
import 'package:ecommerce/pages/botmnavagain.dart';
import 'package:ecommerce/pages/bottomnav.dart';
import 'package:ecommerce/pages/cart.dart';
import 'package:ecommerce/pages/dlvrydate.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:ecommerce/pages/login.dart';
import 'package:ecommerce/pages/otp.dart';
import 'package:ecommerce/pages/otppage.dart';
import 'package:ecommerce/pages/detailspage.dart';
import 'package:ecommerce/pages/selectloc.dart';
import 'package:ecommerce/pages/timer.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main()  {
  // await Hive.initFlutter();
  // var box =await Hive.openBox('deals_array');
  runApp(const MyApp());  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Roboto'),
      // home: const  MyLogin(),
      // home: MyOTP(),
      // home: MYOtpPage(),
      // home: ItemDetailpage(),
      // home: Example(),
      // home: MyHomePage(),
      // home: Home(),
      home: BotmNav(),
      // home: Mybtnnav(),
      // home: Mycart(),
      // home: Locselect(),
      // home: Login(),
      // home: Mybtmnav(),
    );
  }
}
