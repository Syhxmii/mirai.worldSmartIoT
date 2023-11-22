import 'package:flutter/material.dart';
import 'blynk_api.dart';
import 'homepage.dart';

class CahayaPage extends StatefulWidget {
  @override
  _CahayaPageState createState() => _CahayaPageState();
}

class _CahayaPageState extends State<CahayaPage> {
  int lightIntensity = 0;

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
                            'Intensitas Cahaya',
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
                      'Sensor LDR memberikan informasi tentang intensitas cahaya dalam bentuk nilai lux yang dapat diakses dari aplikasi, memungkinkan pemantauan cahaya secara akurat.',
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
            child: Image.asset(
              'assets/ldr.png',
              width: 388.0,
              height: 441.0,
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildOnTextContainer(),
              buildOnText2Container(),
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
          StreamBuilder<int?>(
            stream: BlynkApi.getLdrStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                lightIntensity = snapshot.data!;
                print('Received light intensity data: $lightIntensity');
              }
              return Text(
                '${lightIntensity}lx',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                  fontSize: 40.0,
                  color: Color.fromARGB(255, 34, 37, 56),
                ),
              );
            },
          ),
          SizedBox(height: 3.0),
          Text(
            'Intensitas Cahaya',
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

  Widget buildOnText2Container() {
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
            'LDR',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w800,
              fontSize: 40.0,
              color: Color.fromARGB(255, 34, 37, 56),
            ),
          ),
          SizedBox(height: 3.0),
          Text(
            'Sensor',
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
}
