import 'package:flutter/material.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.blueGrey,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/images/blackpanther.jpg'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Harshil A',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '+91 98577 98645',
                  style: TextStyle(color: Colors.grey.shade300),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 12,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Icon(
                          Icons.people_alt_outlined,
                          size: 25,
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          'New Group',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Icon(
                          Icons.perm_identity_outlined,
                          size: 25,
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          'New Contact',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Icon(
                          Icons.call_outlined,
                          size: 25,
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          'Calls',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: 60,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Icon(
                          Icons.bookmark_border_outlined,
                          size: 25,
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          'Saved Messages',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: 60,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Icon(
                          Icons.settings_outlined,
                          size: 25,
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
