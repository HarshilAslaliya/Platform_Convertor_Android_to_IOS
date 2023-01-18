import 'package:flutter/material.dart';

import '../../globals/globals.dart';

class CallsComponents extends StatefulWidget {
  const CallsComponents({Key? key}) : super(key: key);

  @override
  State<CallsComponents> createState() => _CallsComponentsState();
}

class _CallsComponentsState extends State<CallsComponents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ...allContacts
                  .map((e) => Container(
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
                                  '${e['phone']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.call,
                                size: 30,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ))
                  .toList(),
              ...allContacts1
                  .map((e) => Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: FileImage(e['image']),
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
                                  '${e['phone']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.call,
                                size: 30,
                                color: Colors.green,
                              ),
                            ),SizedBox(
                              width: 10,
                            ),
                          ],
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
