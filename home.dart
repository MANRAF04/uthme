import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Home(),
    Home(),
    Home(),
    Home()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GNav(
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabBorderRadius: 10,
            selectedIndex: _selectedIndex,
            backgroundColor: Colors.white,
            tabBackgroundColor: Colors.black,
            activeColor: Colors.white,
            gap: 8,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.play_lesson,
                text: "Grades",
              ),
              GButton(
                icon: Icons.fastfood,
                text: "Menu",
              ),
              GButton(
                icon: Icons.settings,
                text: "Settings",
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFFE9C46A),
      body: _pages[_selectedIndex]
      
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                width: screenWidth/1.05,
                height: 80,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ), 
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: screenWidth/24),
                              child: ClipRRect(borderRadius: BorderRadius.circular(10),
                                child: RandomAvatar("eraftopoulos",fit: BoxFit.cover,height: 48,width: 48)
                              ),
                            ),
                            SizedBox(width: screenWidth/24,),
                            Container(
                              width: screenWidth/2.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("EMMANOUIL RAFTOPOULOS",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,)),
                                  SizedBox(height: 3,),
                                  Text("ΤΜΗΜΑ ΗΛΕΚΤΡΟΛΟΓΩΝ ΜΗΧΑΝΙΚΩΝ ΚΑΙ ΜΗΧΑΝΙΚΩΝ ΥΠΟΛΟΓΙΣΤΩΝ",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w300))
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF1E1E1E),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  )
                                ), 
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text("03735",style: TextStyle(color: Colors.white),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                  ],
                ),
                ),
            ),
          ],
        ),
      );
  }
}