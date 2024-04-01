import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  isSwitch == false ? HexColor('E0144C') : HexColor('2D0338'),
                  isSwitch == false ? HexColor('FFE15D') : HexColor('810CAB'),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    child: SizedBox(
                      height: 400,
                      width: 400,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Lottie.network(
                                'https://assets5.lottiefiles.com/packages/lf20_xcvaucib.json',
                                fit: BoxFit.contain),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                  color: Colors.amber, shape: BoxShape.circle),
                            ),
                          )
                        ],
                      ),
                    ),
                    duration: Duration(milliseconds: 800),
                    bottom: isSwitch == false ? 5 : -500,
                  ),
                  Positioned(
                    bottom: 0,
                      child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                            image: AssetImage('assets/n.png',))),
                  ))
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: isSwitch == false
                    ? Colors.transparent
                    : Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          Positioned(
              top: 46,
              left: 16,
              child: SizedBox(
                width: 70,
                child: DayNightSwitcher(
                  dayBackgroundColor: Color.fromARGB(255, 255, 231, 153),
                  isDarkModeEnabled: isSwitch,
                  onStateChanged: (bool value) {
                    setState(() {
                      isSwitch = value;
                    });
                  },
                ),
              ))
        ],
      ),
    );
  }
}
