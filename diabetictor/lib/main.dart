//import 'package:diabetictor/pages/landingpage.dart';
import 'package:diabetictor/pages/correction.dart';
import 'package:diabetictor/pages/landingpage.dart';
//import 'package:diabetictor/pages/mainpage.dart';
//import 'package:diabetictor/pages/third.dart';
//import 'package:diabetictor/pages/resultpage.dart';
//import 'package:diabetictor/widgets/listQuestion.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Landingpage(),
        '/main': (context) => MainPage2(),
        //'/result': (context) => ResultPage(), 
         
        //explanation : i decided to dash this 26th line above because in the 
        //listquestion.dart i push the navigator directly by using 
        //MaterialPageRoute for enabling the predictionResult to be 
        //passed through the cunstructor (this situation cannot be handled by the route map) 
      },
      //home: Landingpage(),
    );
  }
}
  