import 'package:breathe/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopUp extends StatefulWidget {
  const PopUp({
    Key? key,
  }) : super(key: key);

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  bool great = false;
  bool fine = false;
  bool bad = false;
  bool meh = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Color.fromARGB(255, 220, 220, 220),
        fontFamily: GoogleFonts.inter().fontFamily,

        //font color black
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
        ),
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Breathe',
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            leading: Container(
              padding: const EdgeInsets.all(7.0),
              margin: const EdgeInsets.only(left: 5.0),
              child: Image.asset('assets/appbar/harmony_black.png'),
            ),
            toolbarHeight: 70,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //horizontally centered text
                Center(
                  child: Text('Hi! Welcome :)', style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: Text('How are you feeling today?',
                        style: TextStyle(fontSize: 15)),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //icon button with text below
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              great = !great;
                              bad = false;
                              fine = false;
                              meh = false;
                            });
                          },
                          icon: Image.asset('assets/pop_up/great.png'),
                          iconSize: 60,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                great = !great;
                                bad = false;
                                fine = false;
                                meh = false;
                              });
                            },
                            child: Text(
                              'Great',
                              style: TextStyle(
                                decoration: great
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                              ),
                            )),
                      ],
                    ),

                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              fine = !fine;
                              bad = false;
                              great = false;
                              meh = false;
                            });
                          },
                          icon: Image.asset('assets/pop_up/fine.png'),
                          iconSize: 50,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                fine = !fine;
                                bad = false;
                                great = false;
                                meh = false;
                              });
                            },
                            child: Text(
                              'Fine',
                              style: TextStyle(
                                decoration: fine
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                              ),
                            )),
                      ],
                    ),

                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              meh = !meh;
                              bad = false;
                              fine = false;
                              great = false;
                            });
                          },
                          icon: Image.asset('assets/pop_up/meh.png'),
                          iconSize: 60,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                meh = !meh;
                                bad = false;
                                fine = false;
                                great = false;
                              });
                            },
                            child: Text(
                              'Meh',
                              style: TextStyle(
                                decoration: meh
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                              ),
                            )),
                      ],
                    ),

                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              bad = !bad;
                              fine = false;
                              great = false;
                              meh = false;
                            });
                          },
                          icon: Image.asset('assets/pop_up/bad.png'),
                          iconSize: 50,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                bad = !bad;
                                fine = false;
                                great = false;
                                meh = false;
                              });
                            },
                            child: Text(
                              'Bad',
                              style: TextStyle(
                                decoration: bad
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),

                SizedBox(
                  height: 50,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: great || fine || meh || bad
                                ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()),
                                    );
                                  }
                                : null,
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            style: ButtonStyle(backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.5);
                                else if (states
                                    .contains(MaterialState.disabled))
                                  return Color.fromARGB(43, 27, 27, 27);
                                return Color.fromARGB(255, 27, 27,27); // Use the component's default.
                              },
                            ))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
