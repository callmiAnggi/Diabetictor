import 'package:flutter/material.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViwState();
}

class _ResultViwState extends State<ResultView> {
  double percentValue = 0.90;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 10.0,
            percent: percentValue,
            animation: true,
            center: Text(
              "${(percentValue*100).toInt()}%", 
              style: TextStyle(
                fontSize: 28,
                color: Colors.white
              ),
            ),
            backgroundColor: Colors.transparent,
            progressColor: Colors.blue[200],
            progressBorderColor: Colors.white,
          ),
        ),
        Column(
          children:[
            Container(
              padding: EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.circular(10),

              ),
              child: Column(
                children: [
                  Text(
                    'your prediction result', 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    'will be displayed as %',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
            //Text('your prediction result'),
            //Text('will be displayed as percentage')
          ],
        )
      ],
    );
  }
}