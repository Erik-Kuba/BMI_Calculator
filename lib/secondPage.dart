import 'package:flutter/material.dart';
import 'package:flutter_8_a/homePage.dart';
import 'package:flutter_8_a/thirdPage.dart';

class secondPage extends StatelessWidget {
  secondPage(
      {super.key,
      required this.norma,
      required this.result,
      required this.nenorma});
  double result = 0;
  String nenorma = '';
  String norma = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A001F).withOpacity(0.90),
      appBar: AppBar(
        backgroundColor: const Color(0xff0A001F).withOpacity(0.90),
        title: Text(
          'BMI жыйынтыгы'.toUpperCase(),
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff0A001F).withOpacity(0.98),
                    borderRadius: BorderRadius.circular(15)),
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width * 0.92,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'BMI эсептоо индекси:' + result.toStringAsFixed(1),
                      style: TextStyle(color: Colors.green, fontSize: 29),
                    ),
                    Text(
                      nenorma,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        norma,
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => thirdPage(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.touch_app,
                            size: 20,
                            color: Colors.yellow,
                          ),
                          Text(
                            'BMI жонундо',
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.09,
                width: double.infinity,
                color: Colors.red,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.home,
                        size: 30,
                        color: Colors.white,
                      ),
                      Text(
                        'Кайра эсептоо'.toUpperCase(),
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
