import 'package:flutter/material.dart';

class UploadPhoto extends StatefulWidget {
  @override
  _UploadPhotoState createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  bool check1 = false;
  bool check2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 21, 21),
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
        backgroundColor: Color.fromARGB(255, 21, 21, 21),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 10,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Go back to feed',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                        const Text(
                          'Take a picture',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        SizedBox(height: 40),
                        IconButton(
                          icon: const Icon(
                            Icons.photo_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                        const Text(
                          'Photo library',
                          style: TextStyle(color: Colors.white, fontSize: 12),
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
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Share options',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 70,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Transform.scale(
                              scale: .8,
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Colors.white,
                                  ),
                                  child: Checkbox(
                                    value: check1,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        check1 = value!;
                                      });
                                    },
                                    activeColor: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              '  Share with my followers',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Transform.scale(
                              scale: .8,
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Colors.white,
                                  ),
                                  child: Checkbox(
                                    value: check2,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        check2 = value!;
                                      });
                                    },
                                    activeColor: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              '  Share with my friends',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
                          style: TextStyle(color: Colors.white, fontSize: 12),
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
                        onPressed: () {},
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
                      onPressed: () {},
                      child: const Text(
                        'Visit our twitter',
                        style: TextStyle(
                            color: Color.fromARGB(64, 255, 255, 255),
                            fontSize: 12),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
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
      ),
    );
  }
}
