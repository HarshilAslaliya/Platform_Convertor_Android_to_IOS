import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertor_app/globals/globals.dart';

class ChatsComponents extends StatefulWidget {
  const ChatsComponents({Key? key}) : super(key: key);

  @override
  State<ChatsComponents> createState() => _ChatsComponentsState();
}

class _ChatsComponentsState extends State<ChatsComponents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ...allContacts
                  .map((e) => InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            context: context,
                            builder: (context) => Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        AssetImage('${e['image']}'),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    '${e['name']}',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${e['phone']}',
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 17),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Send Message',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage('${e['image']}'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${e['name']}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${e['des']}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text(
                                '${e['time']}',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
              ...allContacts1
                  .map((e) => InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            context: context,
                            builder: (context) => Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: FileImage(e['image']),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    '${e['name']}',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${e['phone']}',
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 17),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Send Message',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: FileImage(
                                  e['image'],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${e['name']}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${e['des']}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text(
                                '${e['time']}',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
