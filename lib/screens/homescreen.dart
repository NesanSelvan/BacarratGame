import 'package:baccarat/constant/global.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 57, 87),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 15.0),
      //       child: Container(
      //         height: 40,
      //         width: 40,
      //         decoration: BoxDecoration(
      //             // shape: BoxShape.circle,
      //             boxShadow: [
      //               BoxShadow(
      //                   color: Colors.grey.shade600,
      //                   blurRadius: 0.5,
      //                   spreadRadius: 1.0,
      //                   offset: const Offset(0.2, 0.5))
      //             ],
      //             border: Border.all(width: 3, color: Colors.white),
      //             borderRadius: BorderRadius.circular(50),
      //             image: const DecorationImage(
      //                 image: AssetImage("assets/user.png") as ImageProvider),
      //             color: Colors.yellow),
      //       ),
      //     )
      //   ],
      // ),
      body: Center(
        child: Container(
          color: const Color.fromARGB(255, 13, 57, 87),
          child: Column(
            // mainAxisSize,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset("assets/Group3.png"),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Bounce(
                onPressed: () {
                  Navigator.pushNamed(context, "/game");
                  globals.isselected = false;
                  setState(() {});
                },
                duration: const Duration(milliseconds: 200),
                child: Container(
                    // color: Colors.brown.shade900,
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        gradient: const RadialGradient(colors: [
                          Color.fromARGB(255, 238, 96, 77),
                          Color.fromARGB(255, 139, 36, 25)
                        ], radius: 2.0),
                        boxShadow: const [
                          BoxShadow(blurRadius: 3, color: Colors.red)
                        ],
                        border: Border.all(width: 4, color: Colors.white),
                        borderRadius: BorderRadius.circular(24),
                        color: const Color.fromARGB(255, 238, 96, 77)),
                    child: Center(
                      child: Text(
                        "Play".toUpperCase(),
                        style: GoogleFonts.kanit(
                            fontWeight: FontWeight.w800,
                            fontSize: 25,
                            letterSpacing: 3,
                            color: Colors.white),
                      ),
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              // Bounce(
              //   onPressed: () {},
              //   duration: const Duration(milliseconds: 200),
              //   child: Container(
              //       width: MediaQuery.of(context).size.width * 0.5,
              //       height: MediaQuery.of(context).size.height * 0.08,
              //       decoration: BoxDecoration(
              //           gradient: const RadialGradient(colors: [
              //             Color.fromARGB(255, 7, 155, 98),
              //             Color.fromARGB(255, 4, 66, 42)
              //           ], radius: 2.0),
              //           boxShadow: const [
              //             BoxShadow(
              //               blurRadius: 3,
              //               color: Colors.green,
              //             )
              //           ],
              //           border: Border.all(width: 4, color: Colors.white),
              //           borderRadius: BorderRadius.circular(24),
              //           color: const Color.fromARGB(255, 7, 155, 98)),
              //       child: Center(
              //         child: Text(
              //           "Friends".toUpperCase(),
              //           style: GoogleFonts.kanit(
              //               fontWeight: FontWeight.w800,
              //               fontSize: 22,
              //               letterSpacing: 3,
              //               color: Colors.white),
              //         ),
              //       )),
              // ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   color: const Color.fromARGB(255, 13, 57, 87),
      //   // color: Colors.red,
      //   height: MediaQuery.of(context).size.height * 0.1,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 18.0, right: 18),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Container(
      //             decoration: BoxDecoration(
      //                 border: Border.all(width: 2, color: Colors.white),
      //                 shape: BoxShape.circle,
      //                 color: Colors.white),
      //             height: MediaQuery.of(context).size.height * 0.15,
      //             width: MediaQuery.of(context).size.width * 0.12,
      //             child: Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Image.asset("assets/setting.png"),
      //             )),
      //         Container(
      //             decoration: BoxDecoration(
      //                 border: Border.all(width: 3, color: Colors.white),
      //                 shape: BoxShape.circle,
      //                 color: Colors.teal.shade300),
      //             height: MediaQuery.of(context).size.height * 0.18,
      //             width: MediaQuery.of(context).size.width * 0.12,
      //             child: Padding(
      //               padding: const EdgeInsets.all(7.0),
      //               child: Image.asset(
      //                 "assets/ranking.png",
      //               ),
      //             ))
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
