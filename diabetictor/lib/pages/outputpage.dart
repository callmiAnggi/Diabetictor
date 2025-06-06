//import 'package:diabetictor/widgets/percentOutput.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ResultPage extends StatefulWidget {
  final double predictionResult;
  final Map<String, dynamic> finalAnswer;
  final Map<String, dynamic> finalAnswer2;
  
  const ResultPage({super.key, 
    required this.predictionResult, 
    required this.finalAnswer, 
    required this.finalAnswer2
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  String yesNo(int value) => value == 1 ? 'Yes' : 'No';
  String _genHealthLabel(dynamic value) {
    switch (value) {
      case 1:
        return "Very Good";
      case 2:
        return "Good";
      case 3:
        return "Fair";
      case 4:
        return "Poor";
      case 5:
        return "Very poor";
      default:
        return "Unknown";
    }
  }
  //String 1-5(dynamic value)
  Widget genHealthStars(dynamic value) {

    //widget for genhealthbar
    final dynamic intValue = value.clamp(1, 5);
    final dynamic reversed = 6 - intValue; // So 1 (very good) has longest bar
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'General Health:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            Container(
              width: 100,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              width: 20.0 * reversed, // max 200 when reversed = 5
              height: 10,
              decoration: BoxDecoration(
                color: Colors.green.shade600,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          _genHealthLabel(intValue),
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
      ],
    );
  } 

  @override
  Widget build(BuildContext context) {
    final answer = widget.finalAnswer;
    final answer2 = widget.finalAnswer2;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Prediction Result')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          child: Column(
            
            children: [
              Container(
                //mainAxisAlignment: MainAxisAlignment.center,
                height: 280,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.symmetric(vertical : 5, horizontal: 15),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Diabetictor', style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        ),
                        Icon(Icons.medical_information_outlined, color: Colors.white,)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(3.14159),
                          child : SizedBox(
                            child: CircularPercentIndicator(
                              radius: 80.0,
                              lineWidth: 15.0,
                              percent: widget.predictionResult.clamp(0.0, 1.0),
                              animation: true,
                              backgroundColor: Colors.blue.shade300,
                              progressColor: Colors.white,
                              progressBorderColor: Colors.white,
                              
                            ), 
                          )
                            
                        ),
                        /*
                        SizedBox( 
                            child: CircularPercentIndicator(
                              radius: 80.0,
                              lineWidth: 15.0,
                              percent: widget.predictionResult.clamp(0.0, 1.0),
                              animation: true,
                              backgroundColor: Colors.blue.shade300,
                              progressColor: Colors.white,
                              progressBorderColor: Colors.white,
                              
                            ), 
                            
                            /*
                            width: 150,
                            height: 150,
                            child: CircularProgressIndicator(
                              value: widget.predictionResult.clamp(0.0, 1.0),
                              strokeWidth: 12,
                              color: Colors.deepPurple,
                              backgroundColor: Colors.deepPurple.shade100,
                            ),
                            */
                          ),
                          */
                        Text(
                          "${(widget.predictionResult * 100).toStringAsFixed(1)}%",
                          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        
                      ],
                    ),
                    SizedBox(height: 20,),
                    const Text(
                      "Your Diabetes Risk",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 0),
                  Column(
                    children: [
                      Text('Age', style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),),
                      Text('${answer2['Age']}', style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                      ),),
                    ]
                  ),
                  //SizedBox(width: 1,),
                  Column(
                    children: [
                      Text('BMI', style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),),
                      Text('${answer['BMI']}', style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                      ),),
                    ],
                  ),
                  //SizedBox(width: 5,),
                  Container(
                    //color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    //height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.lightBlueAccent,
                        width: 2
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: 
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          genHealthStars(answer['GenHlth']),
                        ],
                      ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black
                ),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  //pa: EdgeInsets.symmetric(horizontal: 200, vertical: 20),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('poor physical health', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        )),
                        Text('${answer['PhysHlth'].toInt()}/30 days', style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),)
                      ]  
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('poor mental health', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        )),
                        Text('${answer['MentHlth'].toInt()}/30 days', style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white                          
                        ),)
                      ]  
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 65),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  /*
                  border: Border.all(
                    color: Colors.blue,
                    width: 2
                  ),
                  */
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('High Cholesterol'),
                        Text('High Blood Pressure '),
                        Text('Heart Disease or Attack'),
                        Text('Difficulty Walking'),
                        Text('Stroke History'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${yesNo(answer['HighChol'])}'),
                        Text('${yesNo(answer['HighBP'])}'),
                        Text('${yesNo(answer['HeartDiseaseorAttack'])}'),
                        Text('${yesNo(answer['DiffWalk'])}'),
                        Text('${yesNo(answer['Stroke'])}'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5,),
              Text('DISCLAMER'),
              Text(
                'This is not a diagnosis, but a tool for self-evaluation in the meantime. '
                'Please consult a medical professional for a clinical evaluation.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.red,
                  fontWeight: FontWeight.bold
                ),
              ),
              //Text('Please consult to a medical profesional for a clinical evaluation')
            ],
          ),
        ),
      ),
    );
  }
}
