import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _obscText = true;
  final TextEditingController _controllerPwd = TextEditingController();
  final TextEditingController _controllerUsr = TextEditingController();


  void _togglePwd() {
    setState(() {
      _obscText = !_obscText;
    });
  }

  @override
  void dispose() {
    _controllerPwd.dispose();
    _controllerUsr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.robotoTextTheme()),
      home: Scaffold(
          backgroundColor: const Color(0xffE9C46A),
          resizeToAvoidBottomInset: false,
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    child: const Center(
    child: SizedBox(
      width: 228,
      height: 114,
      child: Text(
        "Connect to your academic account",
        style: TextStyle(
          color: Colors.white,
          fontSize: 32,
        ),
        textAlign: TextAlign.left,
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
                const Spacer(),
                Container(alignment: Alignment.center,width: 250,height: 64,decoration: ShapeDecoration(color: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(style: const TextStyle(fontSize: 18),controller: _controllerUsr,decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                          border: InputBorder.none, // Hide the default TextField border
                          hintText: 'Enter username',
                        ),),
                ),),
                const SizedBox(height: 16,),
                Container(alignment: Alignment.center,width: 250,height: 64,decoration: ShapeDecoration(color: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(style: const TextStyle(fontSize: 18),controller: _controllerPwd,obscureText: _obscText,decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                          border: InputBorder.none, // Hide the default TextField border
                          hintText: 'Enter password',
                          suffixIcon: IconButton(icon: Icon(
                            _obscText ? Icons.visibility : Icons.visibility_off,
                          ),onPressed: _togglePwd,)
                        ),),
                ),),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: SizedBox(
                    width: 250,
                    height: 64,
                    child: ElevatedButton(
                        onPressed: () {
                          print("${_controllerUsr.text} : ${_controllerPwd.text}");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2A9D8F), // Background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Expanded(child: Align(alignment: Alignment.center,child: Text("Continue",style: TextStyle(fontSize: 20),))),Icon(Icons.arrow_right_rounded,size: 50,)],),
                      ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}