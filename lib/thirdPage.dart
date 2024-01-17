import 'package:flutter/material.dart';
import 'package:flutter_8_a/homePage.dart';

class thirdPage extends StatelessWidget {
  const thirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A001F).withOpacity(0.90),
      appBar: AppBar(
        backgroundColor: const Color(0xff0A001F).withOpacity(0.90),
        title: Text(
          'BMI жонундо'.toUpperCase(),
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0xff0A001F).withOpacity(0.98),
                borderRadius: BorderRadius.circular(15)),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              'BMI калькулятор-Дене массасынын индексин (BMI) эсептөөгө мүмкүндүк берет.' +
                  'тактап айтканда: Эсептөө сиздин жашыңызга, килограммдагы дене салмагыңызга жана боюңузга негизделген илимий жактан далилденген, бул сизге эң жакшы жана эң так бааны берет.',
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xff0A001F).withOpacity(0.98),
                borderRadius: BorderRadius.circular(15)),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              'Арыктоону каалайсызбы же салмак кошкуңузбу, баары бир, биздин BMI калькуляторубуз менен сиз идеалдуу салмагыңыз кандай болорун жана сиз каалаган BMIден канчалык алыс экениңизди көзөмөлдөй аласыз.',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
          )
        ],
      ),
    );
  }
}
