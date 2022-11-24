import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:breathe/repositories/posts/posts_repository.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';

class Posts extends StatefulWidget {
  final String filter;
  const Posts({Key? key, required this.filter}) : super(key: key);
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: PostsRepository().getPosts(widget.filter),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            var posts = snapshot.data as List<dynamic>;
            return ListView.builder(
              itemCount: posts.length,
              cacheExtent: 9999,
              itemBuilder: (context, index) {
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
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              "@" + posts[index]['user'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Image.network(
                        posts[index]['photoUrl'],
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        posts[index]['caption'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        PostsRepository()
                                            .likePost(posts[index]['id']);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Like",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Container(
                                  child: IconButton(
                                    onPressed: () async {
                                      http.Response response = await http.get(
                                          Uri.parse(posts[index]['photoUrl']));
                                      Directory directory =
                                          await getTemporaryDirectory();
                                      final path = directory.path;
                                      final file = File('$path/image.png');
                                      file.writeAsBytes(response.bodyBytes);

                                      Share.shareFiles(['$path/image.png'],
                                          text: posts[index]['caption']);
                                    },
                                    icon: Icon(
                                      Icons.ios_share,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "Share",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 150),
                            child: Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text(
                                    posts[index]['likes'].toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
