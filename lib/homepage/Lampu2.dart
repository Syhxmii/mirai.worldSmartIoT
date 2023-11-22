import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'homepage.dart';
import 'blynk_api.dart';

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
                          trackHeight: 5,
                          thumbShape: CustomSliderThumbCircle(
                            thumbRadius: 12.0,
                            min: 0,
                            max: 100,
                          ),
                          overlayColor: Colors.transparent,
                          thumbColor: Color(0xFF222538),
                          activeTrackColor: Color(0xFF222538),
                          inactiveTrackColor:Color.fromARGB(255, 237, 239, 242),
                        ),
                        child: Container(
                          height: 330,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Color.fromARGB(255, 237, 239, 242),
                          ),
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
                                        onChanged: (value) {
                                          setState(() {
                                            _verticalSliderValue = value;
                                          });

                                          BlynkApi.setBrightness(value);
                                        },
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
              BlynkApi.toggleLed(value, 5);
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

// CustomSliderThumbCircle class
class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final thumbHeight;
  final int min;
  final int max;

  CustomSliderThumbCircle({
    required this.thumbRadius,
    this.thumbHeight,
    required this.min,
    required this.max,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(thumbRadius, thumbHeight ?? thumbRadius * 2);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double>? activationAnimation,
    Animation<double>? enableAnimation,
    bool isDiscrete = false,
    TextPainter? labelPainter,
    RenderBox? parentBox,
    SliderThemeData? sliderTheme,
    TextDirection? textDirection,
    double value = 0.0,
    double textScaleFactor = 1.0,
    Size? sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = Color(0xFF222538)
      ..style = PaintingStyle.fill;

    TextSpan span = new TextSpan(
      style: new TextStyle(
        fontSize: thumbRadius * 0.8,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      text: '${getValue(value)}',
    );

    TextPainter tp = new TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    tp.layout();
    Offset textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawCircle(center, thumbRadius, paint);
    tp.paint(canvas, textCenter);
  }

  String getValue(double value) {
    return ((max - min) * value).round().toString();
  }
}
