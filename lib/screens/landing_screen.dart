import 'package:flutter/material.dart';
import 'package:suroyapp/reusable_widgets/reusable_widgets.dart';
import 'package:suroyapp/screens/signin_screen.dart';
import 'package:suroyapp/utils/color_utils.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0, 20, 0),
          child: Column(children: <Widget>[
            const SizedBox(height: 130),
            logoWidget('assets/images/landingpage.png'),
            SizedBox(height: 10),
            const Align(
              child: Text("Rent",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 32)),
            ),
            const Text("a perfect vehicle",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 32)),
            const Text("for any occasion",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 32)),
            SizedBox(height: 15),
            const Text(
              "It's never been easier",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Color.fromARGB(255, 133, 132, 132),
              ),
            ),
            const Text(
              "to rent a car using an app.",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Color.fromARGB(255, 133, 132, 132),
              ),
            ),
            const Text(
              "Low rates & quality service.",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Color.fromARGB(255, 133, 132, 132),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.white70;
                  }
                  return const Color.fromARGB(255, 33, 72, 243);
                }),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18))),
                minimumSize: MaterialStateProperty.all(Size(230, 50))
              ),
              child: const Text("Let's go",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    color: Colors.white,
                  )),
            )
          ]),
        )),
      ),
    );
  }
}