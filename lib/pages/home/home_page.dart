import 'package:breathe/pages/home/components/posts/posts.dart';
import 'package:breathe/pages/home/components/resources/resources.dart';
import 'package:breathe/pages/upload_pic/upload_photo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool passwordObscure = true;

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Color.fromARGB(255, 21, 21, 21),
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Breathe',
            style: TextStyle(fontSize: 25),
          ),
          leading: Container(
            padding: const EdgeInsets.all(7.0),
            margin: const EdgeInsets.only(left: 5.0),
            child: Image.asset('assets/appbar/harmony.png'),
          ),
          toolbarHeight: 70,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        bottomNavigationBar: BottomAppBar(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            //Button with an icon and text
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UploadPhoto()),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('New Post'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(150, 30),
                backgroundColor: Color(0xFF1B1B1B),
                foregroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Our twitter', style: TextStyle(fontSize: 12)),
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child:
                  const Text('Our Instagram', style: TextStyle(fontSize: 12)),
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
              ),
            ),
          ]),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child: const Text(
                        'All',
                        style: TextStyle(fontSize: 15),
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child: const Text(
                        'Co-workers',
                        style: TextStyle(fontSize: 15),
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child: const Text(
                        'Enterprise',
                        style: TextStyle(fontSize: 15),
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: const Text(
                        'Resources',
                        style: TextStyle(fontSize: 15),
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: IndexedStack(index: index, children: [
                Posts(),
                Resources(),
              ])),
            ],
          ),
        ),
      ),
    );
  }
}
