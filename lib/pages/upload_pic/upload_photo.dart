import 'dart:io';

import 'package:breathe/pages/home/home_page.dart';
import 'package:breathe/repositories/posts/posts_repository.dart';
import 'package:flutter/material.dart';
//file picker
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/dropdown.dart';

import 'package:image_picker/image_picker.dart';

class UploadPhoto extends StatefulWidget {
  @override
  _UploadPhotoState createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  bool check1 = false;
  bool check2 = false;
  final PostsRepository storage = PostsRepository();
  File? _image;
  String? _fileName;
  String? _path;
  bool _isLoading = false;

  TextEditingController _captionController = TextEditingController();

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 21, 21),
      appBar: AppBar(
        title: const Text(
          'New Post',
          style: TextStyle(fontSize: 25),
        ),
        leading: BackButton(
          color: Colors.white,
        ),
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(255, 21, 21, 21),
        elevation: 0,
      ),
      body: !_isLoading
          ? Container(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 300,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(43, 255, 255, 255),
                              width: 1,
                            ),
                          ),
                          child: _image != null
                              ? Image.file(_image!.absolute)
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.camera)
                                            .then((photo) {
                                          if (photo == null) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content:
                                                    Text('No file selected'),
                                              ),
                                            );
                                            return null;
                                          }
                                          _path = photo.path;
                                          _fileName = photo.name;

                                          setState(() {
                                            _image = File(_path!);
                                          });
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Take a picture',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    SizedBox(height: 40),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.photo_outlined,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        final photo = await FilePicker.platform
                                            .pickFiles(
                                                type: FileType.custom,
                                                allowMultiple: false,
                                                allowedExtensions: [
                                              'jpg',
                                              'png'
                                            ]);

                                        if (photo == null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text('No file selected'),
                                            ),
                                          );
                                          return null;
                                        }

                                        _path = photo.files.single.path!;
                                        _fileName = photo.files.single.name;

                                        setState(() {
                                          _image = File(_path!);
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Photo library',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Caption',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding: const EdgeInsets.only(left: 10.0),
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(43, 255, 255, 255),
                              width: 1,
                            ),
                          ),
                          child: TextField(
                            controller: _captionController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Max 150 words.',
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(43, 255, 255, 255),
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 100),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 120,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                          Container(
                            width: 120,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: TextButton(
                              onPressed: () async {
                                if (_path == null ||
                                    _captionController.text.isEmpty ||
                                    _fileName == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Please fill in all fields'),
                                    ),
                                  );
                                  return null;
                                } else {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  await storage
                                      .createPost(_captionController.text,
                                          _path!, _fileName!)
                                      .then((value) => {
                                            imageCache.clear(),
                                            _isLoading = false,
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomePage()))
                                          });
                                }
                              },
                              child: const Text(
                                'Share',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 21, 21, 21),
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () async {
                              var url = Uri.parse(
                                  "https://twitter.com/Alfonso40243026");

                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'Could not launch';
                              }
                            },
                            child: const Text(
                              'Visit our twitter',
                              style: TextStyle(
                                  color: Color.fromARGB(64, 255, 255, 255),
                                  fontSize: 12),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              var url = Uri.parse(
                                  "https://www.instagram.com/breathe_flutter/");

                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'Could not launch';
                              }
                            },
                            child: const Text(
                              'Visit our instagram',
                              style: TextStyle(
                                  color: Color.fromARGB(64, 255, 255, 255),
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
              color: Colors.white,
            )),
    );
  }
}
