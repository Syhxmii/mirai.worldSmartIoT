import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'homepage.dart';

class Lampu2Page extends StatefulWidget {
  @override
  _Lampu2PageState createState() => _Lampu2PageState();
}

class _Lampu2PageState extends State<Lampu2Page> {
  bool switchValue = false;
  double _verticalSliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              print('home diklik');
            },
            child: Container(
              margin: EdgeInsets.only(left: 9, right: 9, top: 30),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Lampu 2',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              fontSize: 24.0,
                              color: Color.fromARGB(0xFF, 0x22, 0x25, 0x38),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          width: 46.0,
                          height: 46.0,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 237, 239, 242),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/home.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Lampu 2 memiliki fitur yang serupa dengan Lampu 1, namun dilengkapi dengan slider untuk mengatur kecerahan lampu, semuanya dapat dikontrol melalui aplikasi.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        height: 1.2,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: Color.fromARGB(0xFF, 0x22, 0x25, 0x38),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/lampu2.png',
                    width: 165.0,
                    height: 445.0,
                  ),
                ),
                SizedBox(width: 32.0),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 2.0),
                      SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 70,
                          thumbShape: SliderComponentShape.noOverlay,
                          valueIndicatorShape: SliderComponentShape.noOverlay,
                          trackShape: RoundedRectSliderTrackShape(),
                          activeTrackColor: Color(0xFF222538),
                          inactiveTrackColor:
                              Color.fromARGB(255, 237, 239, 242),
                          activeTickMarkColor: Colors.transparent,
                          inactiveTickMarkColor: Colors.transparent,
                        ),
                        child: Container(
                          height: 330,
                          // decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(25.0),
                          //     color: Color.fromARGB(255, 237, 239, 242)),
                          child: Column(
                            children: [
                              const SizedBox(height: 8),
                              Expanded(
                                child: Stack(
                                  children: [
                                    RotatedBox(
                                      quarterTurns: 3,
                                      child: Slider(
                                        value: _verticalSliderValue,
                                        min: 0,
                                        max: 100,
                                        divisions: 50,
                                        label: _verticalSliderValue
                                            .round()
                                            .toString(),
                                        onChanged: (value) {
                                          setState(() {
                                            _verticalSliderValue = value;
                                          });
                                        },
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        '${_verticalSliderValue.round()}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildOnTextContainer(),
              buildSwitchContainer(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildOnTextContainer() {
    return Container(
      width: 160.0,
      height: 120.0,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 237, 239, 242),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            switchValue ? 'ON' : 'OFF',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w800,
              fontSize: 40.0,
              color: Color.fromARGB(255, 34, 37, 56),
            ),
          ),
          SizedBox(height: 3.0),
          Text(
            'Indikator',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0.2,
              fontSize: 12.0,
              color: Color.fromARGB(255, 169, 169, 184),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSwitchContainer() {
    return Container(
      width: 160.0,
      height: 120.0,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 237, 239, 242),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoSwitch(
            activeColor: const Color.fromARGB(255, 34, 37, 56),
            thumbColor: const Color.fromARGB(255, 255, 255, 255),
            trackColor: const Color.fromARGB(255, 162, 169, 184),
            value: switchValue,
            onChanged: (value) {
              setState(() {
                switchValue = value;
              });
            },
          ),
          SizedBox(height: 3.0),
          Text(
            'Turn On/Off',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 1.6,
              fontSize: 12.0,
              color: Color.fromARGB(255, 169, 169, 184),
            ),
          ),
        ],
      ),
    );
  }
}
