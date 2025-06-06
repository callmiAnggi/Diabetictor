import 'package:diabetictor/pages/outputpage.dart';
//import 'package:diabetictor/widgets/percentOutput.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
//import 'package:tflite_flutter_helper_plus/tflite_flutter_helper_plus.dart';



class ListQuestion extends StatefulWidget {
  const ListQuestion({super.key});

  @override
  State<ListQuestion> createState() => _ListQuestionState();
}

class Question {
  final String id;
  final String text;
  final String inputType; 

  Question({required this.id, required this.text, required this.inputType});
}

final List<Question> diabetesQuestions = [
  Question(id: 'Age', text: 'Input your age', inputType: 'number'),
  Question(id: 'weight', text: 'Input your weight', inputType: 'number'),
  Question(id: 'height', text: 'Input your height', inputType: 'number'),
  Question(id: 'GenHlth', text: 'Rate rour general health\n (1 = very good    5 = very poor)', inputType: '1-5'),
  Question(id: 'PhysHlth', text: 'Give the number of days in the last 30 days of you being physically unwell', inputType: '0-30'),
  Question(id: 'MentHlth', text: 'Give the number of days in the last 30 days of you being mentally unwell', inputType: '0-30'),
  Question(id: 'HighChol', text: 'Do you have high cholesterol?', inputType: 'yes_no'),
  Question(id: 'HighBP', text: 'Do you have high blood pressure?', inputType: 'yes_no'),
  Question(id: 'HeartDiseaseorAttack', text: 'Has experienced or diagnosed with hearth attack', inputType: 'yes_no'),
  Question(id: 'DiffWalk', text: 'Difficulty of climbing stairs', inputType: 'yes_no'),
  Question(id: 'Stroke', text: 'Having stroke', inputType: 'yes_no'),
];


class _ListQuestionState extends State<ListQuestion> {
  
  Map<String, dynamic> answers = {}; //to manipulate and produce the user input (string) that will come
  Map<String, dynamic> finalAnswer= {};
  Map<String, dynamic> finalAnswer2= {};
  double? predictionResult; 
  bool allAnswered = false;
  /*
  void _checkAllAnswered() {
    setState(() {
      allAnswered = diabetesQuestions.every((q) => answers.containsKey(q.id) && answers[q.id] != null);
    });
  }
  */

  //this part is to retrieve and keep the user input (string) inside the textfield
  Map<String, TextEditingController> _controllers = {};
  late Interpreter _interpreter;
  bool _modelLoaded = false;
   
  @override
  void initState() {
    super.initState();
    for (var question in diabetesQuestions) {
      _controllers[question.id] = TextEditingController();
    }
    loadModel();
    /*WidgetsBinding.instance.addPostFrameCallback((_) {
      loadModel();
    });
    */
  }
  
  Future<void> loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset('assets/model/model.tflite');
      setState(() {
        _modelLoaded = true;
      });
      print("Model loaded successfully.");
    } catch (e) {
      print("Error loading model: $e");
    }
  }
  


  Widget _buildQuestion(int index) { //widget for each individual questions
    //int currval = 0;
    final question = diabetesQuestions[index];
    final currentValue = answers[question.id];
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        if (question.inputType == 'number') 
          TextField(
            controller: _controllers[question.id],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter number',
            ),
            onChanged: (value) {
              setState(() {
                answers[question.id] = value;
              });
            },
          )
        
        else if (question.inputType == '1-5')
          SfSlider(
            min: 1,
            max: 5,
            value: currentValue ?? 1, 
            interval: 1,
            showTicks: true,
            showLabels: true,
            stepSize: 1,
            onChanged: (dynamic value) { //dynamic to handle real time data (rating slider) changing 
              setState(() {
                answers[question.id] = value;
                //_checkAllAnswered();
              });
            },
          )
        else if (question.inputType == '0-30')
            SfSlider(
              min: 0,
              max: 30,
              value: currentValue ?? 0,
              interval: 5,
              showTicks: true,
              showLabels: true,
              stepSize: 1,
              onChanged: (dynamic value) {
                setState(() {
                  answers[question.id] = value;
                  //_checkAllAnswered();
                });
              },
              
              
            )

        else if (question.inputType == 'yes_no')
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                        answers[question.id] = true; //pressing this button will give true = 1
                        //_checkAllAnswered();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: currentValue == true ? Colors.blue : null,
                  ),
                  child: Text(
                    'Yes', 
                    style: TextStyle(
                      color: currentValue == true ? Colors.white : null
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                        answers[question.id] = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: currentValue == false ? Colors.red : null,
                  ),
                  child: Text(
                    'No',
                    style: TextStyle(
                      color: currentValue == false ? Colors.white : null
                    ),
                  ),
                ),
              ),
            ],
          )
      ],
    ),
      
    );
  }

  @override
  Widget build(BuildContext context) {  //this widget is to wrap the whole questions widget inside 1 container and the submit button with its logic
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        //height: 400,
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(10)
          ),
          padding: EdgeInsets.all(5),
      
          child: Column(
            children: [
              Expanded(child: ListView.builder(
                itemCount: diabetesQuestions.length,
                itemBuilder: (context, index) {
                    
                  return  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: _buildQuestion(index),
                  );
                  //final question = diabetesQuestions[index];
                  //return Text(question.text, style: TextStyle(color: Colors.white),);
                  },
                ), 
              ),

              SizedBox(height: 10),
              ElevatedButton( //submition button handler
                onPressed: () async {

                  showDialog(
                    context: context, 
                    barrierDismissible: false,
                    builder: (context) =>
                      Center(child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white), 
                        strokeWidth: 6.0,
                      )
                      ),
                  );
                  await Future.delayed(Duration(seconds: 2));
                  Navigator.of(context).pop();
                  //Navigator.pushNamed(context, '/result');

                  Map<String, dynamic> modelInput = {};  //to dynamically set all the answer from string to int/double and mapping the age category
                  
                  int mapAgeToCategory(int age) { //map the real age number from user as categorical number to match the model data training
                    if (age >= 18 && age <= 24) return 1;
                    if (age <= 29) return 2;
                    if (age <= 34) return 3;
                    if (age <= 39) return 4;
                    if (age <= 44) return 5;
                    if (age <= 49) return 6;
                    if (age <= 54) return 7;
                    if (age <= 59) return 8;
                    if (age <= 64) return 9;
                    if (age <= 69) return 10;
                    if (age <= 74) return 11;
                    if (age <= 79) return 12;
                    return 13; // age >= 80
                  }
                  for (var q in diabetesQuestions) {
                    final val = answers[q.id];
                    if (val == null) continue;

                    if (q.id == 'Age'){
                      final parsedAge = int.tryParse(val.toString());
                      if (parsedAge != null) {
                        modelInput[q.id] = mapAgeToCategory(parsedAge);
                      }
                    }
                    else if (q.inputType == 'yes_no') {
                      modelInput[q.id] = (val == true) ? 1 : 0; 
                    }
                    
                    else {
                      modelInput[q.id] = val;
                    }
                    
                  }
                  //BMI is calculated from weight and height, and must be round up and int type to match the model data training
                  if (modelInput.containsKey('weight') && modelInput.containsKey('height')) {
                    final weight = double.tryParse(modelInput['weight'].toString());
                    final height = double.tryParse(modelInput['height'].toString());
                    if (weight != null && height != null && height > 0) {
                      final heightInMeters = height / 100;
                      final bmi = (weight / (heightInMeters * heightInMeters)).round();
                      modelInput['BMI'] = bmi;
                    }
                  }
                  modelInput.remove('weight');
                  modelInput.remove('height');
                  print("Button pressed");
                  print("Submitted! to : $modelInput");
                  

                  modelInput.forEach((key, value) {
                    print("Key: $key, Value: $value, Type: ${value.runtimeType}");
                  });

                  //final inputList = await prepareInputList(modelInput);
                  
                  if (_modelLoaded) {
                    print("Button pressed");
                    // Use the input list to make a prediction
                    var output = List.filled(1, 0.0).reshape([1, 1]);
                    
                    
                    final inputList = [
                      [                  
                        modelInput['Age'],                  
                        modelInput['GenHlth'],              
                        modelInput['PhysHlth'],             
                        modelInput['MentHlth'],             
                        modelInput['HighChol'], 
                        modelInput['HighBP'],                                         
                        modelInput['HeartDiseaseorAttack'], 
                        modelInput['DiffWalk'],
                        modelInput['Stroke'], 
                        modelInput['BMI'],
                      ]  
                    ];
                    _interpreter.run(inputList, output);
                    /*
                    setState(() {
                      predictionResult = output[0][0];
                    });
                    */
                    Navigator.push( //push to resultPage for Output UI
                      context, 
                      MaterialPageRoute(
                        builder: (context)=>ResultPage(
                          predictionResult: output[0][0], //for setting up the output into percentage
                          finalAnswer : modelInput, //for calling all the input except age (age is set into categorical level)
                          finalAnswer2 : answers //for calling back the real number of user age 
                        ),
                      )
                    );
                    // Handle prediction results
                    print("Prediction Result: $output");
                    
                  } else {
                    print("Model is not loaded yet!");
                  }
                  
                },
                
                style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 150, vertical: 10),
                backgroundColor: Colors.blue[500],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Submit", 
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  )
                ),
                 

              ),
              
            ],
          ),
        ),
    );
  }
}






