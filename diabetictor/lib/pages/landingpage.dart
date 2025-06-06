
import 'package:flutter/material.dart';


class Landingpage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(opacity : 0.3,
                child: Image.asset('assets/imgs/welcomeBg.png',
                  fit: BoxFit.cover,
                ),
                )
              ),
              Center(
                child: Column(
                  children: [
                    
                    SizedBox(height: 180),
                    Text(
                      'Diabetictor', 
                      style: TextStyle(
                        fontSize: 48,  
                        color: Colors.white, 
                        fontWeight: FontWeight.bold
                        )
                    ),
                    Padding(
                      padding: 
                      EdgeInsets.symmetric(
                        horizontal: 45.0, 
                        vertical: 26.0), 
                      child: Text(
                        'Predict your type 2 diabetes likelihood to arise your health lifestyle awareness!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, 
                        ),
                      ),
                    ),
                    //SizedBox(height: 80,),
                    SizedBox(height: 150,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/main');}, 
                        style: ElevatedButton.styleFrom(
                        side: BorderSide(),
                        backgroundColor: Colors.blue[400],
                        //backgroundColor: Color(0xFF60E500),
                        fixedSize: Size(282, 62),
                      ),
                      child: Text(
                        'Predict your diabetes', 
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                          ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }
}
