import 'package:flutter/material.dart';
import 'package:flutter_8_a/secondPage.dart';

Color inactiveColor = const Color(0xff0B0120);
Color activeColor = Colors.grey;

enum GenderEnum {
  male,
  female,
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color maleColor = inactiveColor;
  Color femaleColor = inactiveColor;
  double heightValue = 170;
  int weighth = 50;
  int age = 23;
  double result = 0;

  void changeGenderColor3(GenderEnum gender) {
    if (gender == GenderEnum.male) {
      maleColor = activeColor;
      femaleColor = inactiveColor;
    } else if (gender == GenderEnum.female) {
      femaleColor = activeColor;
      maleColor = inactiveColor;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff221935),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'BMI эсептегич',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xffffffff),
            ),
          ),
        ),
        backgroundColor: Color(0xff221935),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GenderWidget(
                icon: Icons.male,
                text: 'Male',
                onTap: () {
                  changeGenderColor3(GenderEnum.male);
                },
                tus: maleColor,
              ),
              GenderWidget(
                icon: Icons.female,
                text: 'feMale',
                onTap: () {
                  changeGenderColor3(GenderEnum.female);
                },
                tus: femaleColor,
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.92,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xff0A001F).withOpacity(0.98),
            ),
            child: Column(children: [
              Text(
                'Height'.toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    heightValue.toStringAsFixed(1),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'cm'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Slider(
                value: heightValue,
                onChanged: (value) {
                  setState(() {
                    heightValue = value;
                  });
                },
                max: 220,
                min: 135,
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  color: Color(0xff0A001F).withOpacity(0.98),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'weighth'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      weighth.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              weighth--;
                            });
                          },
                          icon: const Icon(
                            Icons.remove_circle,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              weighth++;
                            });
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  color: Color(0xff0A001F).withOpacity(0.98),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Age'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      age.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                          icon: const Icon(
                            Icons.remove_circle,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              setState(() {
                String nenorma = '';
                String norma = '';

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => secondPage(
                      result: result,
                      nenorma: nenorma,
                      norma: norma,
                    ),
                  ),
                );
                result = weighth / ((heightValue / 100) * (heightValue / 100));
                if (age >= 18 && age <= 24 && result < 20) {
                  nenorma = 'Тез Семириниз';

                  norma = 'Тилекке каршы сиздин салмагыныз нормадан томон ';
                } else if (age >= 18 &&
                    age <= 24 &&
                    result >= 20 &&
                    result <= 25) {
                  nenorma = 'Болот';
                  norma = 'Сиздин дене салмагыныз нормалдуу.Азаматсыз!';
                } else if (age >= 18 &&
                    age <= 24 &&
                    result >= 25 &&
                    result <= 30) {
                  nenorma = 'Тез арыктаныз!';
                  norma =
                      'Тилекке каршы сиздин салмагыныз нормадан жогоруу.Мумкун болсо батыраак арыктаныз!';
                } else if (age >= 18 && age <= 24 && result > 31) {
                  nenorma = 'Адам болбойсун,Дагы арыктаныз!';
                  norma =
                      'Тилекке каршы сиздин салмагыныз нормадан абдан жогоруу.Азыртадан чуркап баштаныз!';
                }

                if (age >= 25 && age <= 34 && result < 21) {
                  nenorma = 'Тез Семириниз!';
                  norma = 'Тилекке каршы сиздин салмагыныз нормадан томон ';
                } else if (age >= 25 &&
                    age <= 34 &&
                    result >= 21 &&
                    result <= 26) {
                  nenorma = 'Болот';
                  norma = 'Сиздин дене салмагыныз нормалдуу.Азаматсыз!';
                } else if (age >= 25 &&
                    age <= 34 &&
                    result >= 26 &&
                    result <= 31) {
                  nenorma = 'Тез арыктаныз!';
                  norma =
                      'Тилекке каршы сиздин салмагыныз нормадан жогоруу.Мумкун болсо батыраак арыктаныз!';
                } else if (age >= 24 && age <= 34 && result > 32) {
                  nenorma = 'Адам болбойсун,Дагы арыктаныз';
                  norma =
                      'Тилекке каршы сиздин салмагыныз нормадан абдан жогоруу.Азыртадан чуркап баштаныз!';
                }
                if (age >= 18 && age <= 24 && result < 20) {
                  nenorma = 'Тез Семириниз!';
                  norma = 'Тилекке каршы сиздин салмагыныз нормадан томон ';
                } else if (age >= 18 &&
                    age <= 24 &&
                    result >= 20 &&
                    result <= 25) {
                  nenorma = 'Болот!';
                  norma = 'Сиздин дене салмагыныз нормалдуу.Азаматсыз!';
                } else if (age >= 18 &&
                    age <= 24 &&
                    result >= 25 &&
                    result <= 30) {
                  nenorma = 'Тез арыктаныз!';
                  norma =
                      'Тилекке каршы сиздин салмагыныз нормадан жогоруу.Мумкун болсо батыраак арыктаныз!';
                } else if (age >= 18 && age <= 24 && result > 31) {
                  nenorma = 'Адам болбойсун,Дагы арыктаныз!';
                  norma =
                      'Тилекке каршы сиздин салмагыныз нормадан абдан жогоруу.Азыртадан чуркап баштаныз!';
                }

                if (age >= 35 && age <= 44 && result < 22) {
                  nenorma = 'Тез Семириниз';
                  norma = 'Тилекке каршы сиздин салмагыныз нормадан томон ';
                } else if (age >= 35 &&
                    age <= 44 &&
                    result >= 22 &&
                    result <= 27) {
                  nenorma = 'Болот!';
                  norma = 'Сиздин дене салмагыныз нормалдуу.Азаматсыз!';
                } else if (age >= 35 &&
                    age <= 44 &&
                    result >= 27 &&
                    result <= 32) {
                  nenorma = 'Тез арыктаныз!';
                  norma =
                      'Тилекке каршы сиздин салмагыныз нормадан жогоруу.Мумкун болсо батыраак арыктаныз!';
                } else if (age >= 35 && age <= 44 && result > 32) {
                  nenorma = 'Адам болбойсун,Дагы арыктаныз!';
                  norma =
                      'Тилекке каршы сиздин салмагыныз нормадан абдан жогоруу.Азыртадан чуркап баштаныз!';
                }

                if (age >= 45 && age <= 54 && result < 23) {
                  nenorma = 'Тез Семириниз!';
                  norma = 'Тилекке каршы сиздин салмагыныз нормадан томон ';
                } else if (age >= 45 &&
                    age <= 54 &&
                    result >= 22 &&
                    result <= 27) {
                  nenorma = 'Болот!';
                  norma = 'Сиздин дене салмагыныз нормалдуу.Азаматсыз!';
                } else if (age >= 45 &&
                    age <= 54 &&
                    result >= 27 &&
                    result <= 32) {
                  nenorma = 'Тез арыктаныз!';
                  norma =
                      'Тилекке каршы сиздин салмагыныз нормадан жогоруу.Мумкун болсо батыраак арыктаныз!';
                } else if (age >= 45 && age <= 54 && result > 33) {
                  nenorma = 'Адам болбойсунуз,Дагы арыктаныз!';
                  norma =
                      'Тилекке каршы сиздин салмагыныз нормадан абдан жогоруу.Азыртадан чуркап баштаныз!';
                }

                if (age >= 55 && age <= 64 && result < 24) {
                  nenorma = 'Тез Семириниз!';
                  norma = 'Тилекке каршы сиздин салмагыныз нормадан томон ';
                } else if (age >= 55 &&
                    age <= 64 &&
                    result >= 24 &&
                    result <= 28) {
                  nenorma = 'Болот!';
                  norma = 'Сиздин дене салмагыныз нормалдуу.Азаматсыз!';
                } else if (age >= 55 &&
                    age <= 64 &&
                    result >= 28 &&
                    result <= 33) {
                  nenorma = 'Тез арыктаныз!';
                  norma =
                      'Тилекке каршы сиздин салмагыныз нормадан жогоруу.Мумкун болсо батыраак арыктаныз!';
                } else if (age >= 55 && age <= 64 && result > 34) {
                  nenorma = 'Дагы арыктаныз!';
                  norma =
                      'Тилекке каршы сиздин салмагыныз нормадан абдан жогоруу.Азыртадан чуркап баштаныз!';
                }

                if (age >= 65 && result < 25) {
                  nenorma = 'Тез Семириниз!';
                  norma = 'Тилекке каршы сиздин салмагыныз нормадан томон ';
                } else if (age <= 65 && result >= 25 && result <= 30) {
                  nenorma = 'Болот!';
                  norma = 'Сиздин дене салмагыныз нормалдуу.Азаматсыз!';
                } else if (age <= 65 && result >= 30 && result <= 35) {
                  nenorma = 'Тез арыктаныз!';
                  norma =
                      'Тилекке каршы сиздин салмагыныз нормадан жогоруу.Мумкун болсо батыраак арыктаныз!';
                } else if (age >= 65 && result > 35) {
                  nenorma = 'Дагы арыктаныз!';
                  norma =
                      'Тилекке каршы сиздин салмагыныз нормадан абдан жогоруу.Азыртадан чуркап баштаныз!';
                }
              });
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.09,
              width: double.infinity,
              color: Colors.red,
              child: Center(
                child: Text(
                  'эсептоо'.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    super.key,
    this.icon,
    this.text,
    this.onTap,
    this.tus,
  });
  final IconData? icon;
  final String? text;
  final Function()? onTap;
  final Color? tus;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: tus,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: const Color(0xffffffff)),
            Text(
              text!.toUpperCase(),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color(0xffffffff),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
