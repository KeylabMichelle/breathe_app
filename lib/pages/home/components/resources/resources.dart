import 'package:flutter/material.dart';

class Resources extends StatefulWidget {
  @override
  _ResourcesState createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Divider(
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Resources for the soul's health. ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Music",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 20),
                        child: Image.asset(
                          'assets/test.png',
                          height: 100,
                          width: 100,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      //container with a text align to left
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 40),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Lorem ipsum ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Background Videos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Image.asset(
                          'assets/test.png',
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      //container with a text align to left
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 40),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Lorem ipsum ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
