import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: const Color(0xffE9C46A),
          body: Column(
            children: [
              Stack(alignment: const Alignment(0, 1.4), children: [
                Container(
                  width: double.infinity,
                  height: 320,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFE76F51),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(150),
                        bottomRight: Radius.circular(150),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Image.asset('assets/UTH_Logo.png'),
                ),
              ]),
            ],
          )),
    );
  }
}
