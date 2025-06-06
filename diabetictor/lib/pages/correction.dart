import 'package:diabetictor/widgets/listQuestion.dart';
import 'package:diabetictor/widgets/resultView.dart';
import 'package:flutter/material.dart';
//import 'package:percent_indicator/percent_indicator.dart';


class MainPage2 extends StatefulWidget {

  @override
  State<MainPage2> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage2> {
  //just example for percentage
  //double percentValue = 0.80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body : SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: Text(
              'Get Your Prediction', 
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
            
          //SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[600],
                borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.symmetric(vertical : 20, horizontal: 5),
              child: ResultView(),
            ),
          ),
          //SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Input your data',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width: 15,),
                Icon(
                  Icons.person,
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            //flex: 8,
            //padding: const EdgeInsets.all(0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[100]
              ),
              padding: EdgeInsets.all(0),
              child: ListQuestion(),
            ),
          ),
          
          /*
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[100]
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                          Navigator.pushNamed(context, '/main');}, 
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(),
                          backgroundColor: Colors.blue[400],
                          //backgroundColor: Color(0xFF60E500),
                          fixedSize: Size(280, 52),
                        ),
                        child: Text(
                          'Predict your diabetes', 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                            ),
                        ),
                ),
              ),
            ),
            )
            */
          //ListQuestion(),
          ],
        ),
      ),
/*
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget> [
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 10.0),
              child: Text(
              'Get Your Prediction', 
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.all(16),
                child: ResultView(),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Input your data',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: 15,),
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(height: 8,),
            Expanded(
              //padding: const EdgeInsets.all(0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100]
                ),
                padding: EdgeInsets.all(0),
                child: ListQuestion(),
              ),
            ),
            //ListQuestion(),
            
            

          ],
        ),
      ),
      */
    );
  }
}


