import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:breathe/repositories/resources/resources_repository.dart';

class Resources extends StatefulWidget {
  @override
  _ResourcesState createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  @override
  //on init get resources
  void initState() {
    super.initState();
    ResourcesRepository().getResources();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: ResourcesRepository().getResources(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                var resources = snapshot.data as List<dynamic>;
                print(resources[0]['music'][0]['image']);
                return Column(
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
                    Container(
                      height: 140,
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: resources[0]['music'].length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  width: 110,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    var url = Uri.parse(
                                        resources[0]['music'][index]['url']);

                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url);
                                    } else {
                                      throw 'Could not launch';
                                    }
                                  },
                                  child: Image.network(
                                    resources[0]['music'][index]['image'],
                                    height: 100,
                                    width: 100,
                                    alignment: Alignment.centerLeft,
                                  ),
                                ),
                                Text(
                                  resources[0]['music'][index]['name'],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Blogs",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 140,
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: resources[0]['blogs'].length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  width: 110,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    var url = Uri.parse(
                                        resources[0]['blogs'][index]['url']);

                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url);
                                    } else {
                                      throw 'Could not launch';
                                    }
                                  },
                                  child: Image.network(
                                    resources[0]['blogs'][index]['image'],
                                    height: 100,
                                    width: 100,
                                    alignment: Alignment.centerLeft,
                                  ),
                                ),
                                Text(
                                  resources[0]['blogs'][index]['name'],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
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
                    Container(
                      height: 140,
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: resources[0]['backround videos'].length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  width: 110,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    var url = Uri.parse(resources[0]
                                        ['backround videos'][index]['url']);

                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url);
                                    } else {
                                      throw 'Could not launch';
                                    }
                                  },
                                  child: Image.network(
                                    resources[0]['backround videos'][index]
                                        ['image'],
                                    height: 100,
                                    width: 100,
                                    alignment: Alignment.centerLeft,
                                  ),
                                ),
                                Text(
                                  resources[0]['backround videos'][index]
                                      ['name'],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Places",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 140,
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: resources[0]['places'].length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  width: 110,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    var url = Uri.parse(
                                        resources[0]['places'][index]['url']);

                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url);
                                    } else {
                                      throw 'Could not launch';
                                    }
                                  },
                                  child: Image.network(
                                    resources[0]['places'][index]['image'],
                                    height: 100,
                                    width: 100,
                                    alignment: Alignment.centerLeft,
                                  ),
                                ),
                                Text(
                                  resources[0]['places'][index]['name'],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
/* 
            print(snapshot.data);
            var data = snapshot.data as List<dynamic>;
            return Container(
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
                      itemCount: data[0]['music'].length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10, right: 20),
                              child: Image.asset(
                                data[0]['music'][index]['image'],
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
                ],
              ),
            );
          }),
    );
  }
}
 */