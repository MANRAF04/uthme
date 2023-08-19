import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: const Color(0xFFE9C46A),
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        
        children: [
          Container(
            width: screenWidth/1.05,
            height: 80,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ), 
            child: Column(
              children: [
                Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth/24),
                          child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network("https://via.placeholder.com/48x48",fit: BoxFit.cover,)),
                        ),
                        Container(height: 80,child: Text("EMMANOUELA MARTINEZ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),))
                      ],
                    ),
              ],
            ),
            ),
        ],
      ),
    );
  }
}