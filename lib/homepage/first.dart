import 'package:flutter/material.dart';
import 'homepage.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'SMART HOME',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                  fontSize: 40.0,
                  color: Color.fromARGB(255, 34, 37, 56),
                ),
              ),
            ),
            Container(
              child: Text(
                'IOT',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                  fontSize: 40.0,
                  color: Color.fromARGB(255, 34, 37, 56),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              width: 320,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/iot.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 42.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                height: 45.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 34, 37, 56),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                height: 45.0,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 162, 169, 184),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'Signup',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
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
