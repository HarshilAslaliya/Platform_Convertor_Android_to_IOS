import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertor_app/views/components/calls_components.dart';
import 'package:platform_convertor_app/views/components/chats_components.dart';
import 'package:platform_convertor_app/views/components/drawer_component.dart';
import 'package:platform_convertor_app/views/components/settings_components.dart';

import 'globals/globals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController tabController;

  PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  int current = 0;
  int currentCupertinoIndex = 0;

  TextEditingController _name = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _call = TextEditingController();

  getImage() async {
    ImagePicker pick = ImagePicker();
    XFile? file = await pick.pickImage(source: ImageSource.camera);
    if (file != null) {
      setState(() {
        Globals.image = File(file.path);
      });
    }
  }

  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return (Globals.isIos == false)
        ? MaterialApp(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: Colors.blueGrey,
                secondary: Colors.blueGrey,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              drawer: Drawer(
                child: DrawerComponent(),
              ),
              appBar: AppBar(
                title: Text(
                  'Platform Convertor App',
                  style: TextStyle(fontSize: 22),
                ),
                actions: [
                  Transform.scale(
                    scale: 1.3,
                    child: Switch(
                        inactiveThumbImage:
                            AssetImage('assets/images/android1.png'),
                        activeThumbImage: AssetImage('assets/images/apple.png'),
                        value: Globals.isIos,
                        onChanged: (val) {
                          setState(() {
                            Globals.isIos = val;
                          });
                        }),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
                bottom: TabBar(
                    onTap: (val) {
                      pageController.animateToPage(val,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    indicatorWeight: 4,
                    indicatorColor: Colors.white,
                    controller: tabController,
                    tabs: [
                      Tab(
                        child: Text(
                          'Chats',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Calls',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Settings',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ]),
              ),
              body: PageView(
                controller: pageController,
                onPageChanged: (val) {
                  tabController.animateTo(val);
                },
                children: [
                  ChatsComponents(),
                  CallsComponents(),
                  SettingsComponents(),
                ],
              ),
              floatingActionButton: Builder(builder: (context) {
                return FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder: (context, setState) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                scrollable: true,
                                content: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  width: MediaQuery.of(context).size.width * 2,
                                  child: Stepper(
                                      currentStep: current,
                                      onStepTapped: (val) {
                                        setState(() {
                                          current = val;
                                        });
                                      },
                                      onStepContinue: () {
                                        setState(() {
                                          if (current < 3) {
                                            ++current;
                                          }
                                        });
                                      },
                                      onStepCancel: () {
                                        setState(() {
                                          if (current > 0) {
                                            --current;
                                          }
                                        });
                                      },
                                      controlsBuilder:
                                          (context, controlDetails) {
                                        return Row(
                                          children: [
                                            controlDetails.stepIndex == 0
                                                ? ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        if (current < 3) {
                                                          ++current;
                                                        }
                                                      });
                                                    },
                                                    child: const Text('NEXT'),
                                                  )
                                                : controlDetails.stepIndex == 1
                                                    ? Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  if (formKey1
                                                                      .currentState!
                                                                      .validate()) {
                                                                    formKey1
                                                                        .currentState!
                                                                        .save();
                                                                    if (current <
                                                                        3) {
                                                                      ++current;
                                                                    }
                                                                  }
                                                                });
                                                              },
                                                              child: const Text(
                                                                  'NEXT'),
                                                            ),
                                                            SizedBox(
                                                              width: 15,
                                                            ),
                                                            OutlinedButton(
                                                              onPressed:
                                                                  controlDetails
                                                                      .onStepCancel,
                                                              child: const Text(
                                                                  'BACK'),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : controlDetails
                                                                .stepIndex ==
                                                            2
                                                        ? Container(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      if (formKey2
                                                                          .currentState!
                                                                          .validate()) {
                                                                        formKey2
                                                                            .currentState!
                                                                            .save();
                                                                        if (current <
                                                                            3) {
                                                                          ++current;
                                                                        }
                                                                      }
                                                                    });
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                          'NEXT'),
                                                                ),
                                                                SizedBox(
                                                                  width: 15,
                                                                ),
                                                                OutlinedButton(
                                                                  onPressed:
                                                                      controlDetails
                                                                          .onStepCancel,
                                                                  child:
                                                                      const Text(
                                                                          'BACK'),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        : controlDetails
                                                                    .stepIndex >=
                                                                3
                                                            ? Container(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          if (formKey3
                                                                              .currentState!
                                                                              .validate()) {
                                                                            formKey3.currentState!.save();
                                                                            if (current <
                                                                                3) {
                                                                              ++current;
                                                                            }
                                                                          }
                                                                          allContacts1
                                                                              .add({
                                                                            'name':
                                                                                Globals.name,
                                                                            'des':
                                                                                Globals.description,
                                                                            'phone':
                                                                                Globals.call,
                                                                            'image':
                                                                                Globals.image,
                                                                            'time':
                                                                                'now',
                                                                          });
                                                                          print(
                                                                              '${allContacts1}');
                                                                          Navigator.pop(
                                                                              context);
                                                                        });
                                                                        this.setState(
                                                                            () {
                                                                          // _name.clear();
                                                                          // _call.clear();
                                                                          // _description.clear();
                                                                          // Globals.image = null;
                                                                        });

                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          const SnackBar(
                                                                            content:
                                                                                Text("Your Data Saved"),
                                                                          ),
                                                                        );
                                                                      },
                                                                      // controlDetails.onStepContinue,
                                                                      child: const Text(
                                                                          'SAVE'),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 15,
                                                                    ),
                                                                    OutlinedButton(
                                                                      onPressed:
                                                                          controlDetails
                                                                              .onStepCancel,
                                                                      child: const Text(
                                                                          'BACK'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            : TextButton(
                                                                onPressed:
                                                                    controlDetails
                                                                        .onStepCancel,
                                                                child:
                                                                    const Text(
                                                                        'BACK'),
                                                              ),
                                          ],
                                        );
                                      },
                                      steps: [
                                        Step(
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'PROFILE PHOTO',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                'Add profile photo',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                          content: Container(
                                            child: Stack(
                                              children: [
                                                Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const Alignment(
                                                              0, -0.7),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            getImage();
                                                          });
                                                        },
                                                        child: CircleAvatar(
                                                          radius: 45,
                                                          backgroundColor:
                                                              Colors.grey
                                                                  .shade300,
                                                          backgroundImage:
                                                              (Globals.image !=
                                                                      null)
                                                                  ? FileImage(
                                                                      Globals
                                                                          .image!)
                                                                  : null ,
                                                          child: Container(
                                                            decoration:
                                                                const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle),
                                                            child: Text(
                                                              (Globals.image !=
                                                                      null)
                                                                  ? ""
                                                                  : "ADD",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.1,
                                                  child: Align(
                                                    alignment: const Alignment(
                                                        0.4, 0.8),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          getImage();
                                                        });
                                                      },
                                                      child: const CircleAvatar(
                                                        radius: 15,
                                                        backgroundColor:
                                                            Colors.blueGrey,
                                                        child: Icon(
                                                          CupertinoIcons.add,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          isActive:
                                              (current >= 0) ? true : false,
                                        ),
                                        Step(
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'NAME',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                'Enter name',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                          content: Form(
                                            key: formKey1,
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller: _name,
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return 'Invalid Name';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  onSaved: (val) {
                                                    Globals.name = val;
                                                  },
                                                  style: const TextStyle(
                                                      fontSize: 17),
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  decoration:
                                                      const InputDecoration(
                                                    enabled: true,
                                                    hintText:
                                                        "Harshil Aslaliya",
                                                    hintStyle: TextStyle(
                                                      fontSize: 17,
                                                    ),
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          isActive:
                                              (current >= 1) ? true : false,
                                        ),
                                        Step(
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'CALL DETAILS',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                'Enter Phonenumber',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                          content: Form(
                                            key: formKey2,
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller: _call,
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return 'Invalid Phonenumber';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  onSaved: (val) {
                                                    Globals.call = val;
                                                  },
                                                  style: const TextStyle(
                                                      fontSize: 17),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration:
                                                      const InputDecoration(
                                                    enabled: true,
                                                    hintText: "+91 00000 00000",
                                                    hintStyle: TextStyle(
                                                      fontSize: 17,
                                                    ),
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          isActive:
                                              (current >= 2) ? true : false,
                                        ),
                                        Step(
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'DESCRIPTION',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                'Enter description',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                          content: Form(
                                            key: formKey3,
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller: _description,
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return 'Invalid Description';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  onSaved: (val) {
                                                    Globals.description = val;
                                                  },
                                                  style: const TextStyle(
                                                      fontSize: 17),
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  decoration:
                                                      const InputDecoration(
                                                    enabled: true,
                                                    hintText: "Description",
                                                    hintStyle: TextStyle(
                                                      fontSize: 17,
                                                    ),
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          isActive:
                                              (current >= 3) ? true : false,
                                        ),
                                      ]),
                                  // StepperComponents(),
                                ),
                              ),
                            );
                          });
                    });
                  },
                  child: Icon(
                    Icons.add,
                    size: 30,
                  ),
                );
              }),
            ),
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                leading: Builder(builder: (context) {
                  return GestureDetector(
                      onTap: () {
                        showCupertinoDialog(
                            context: context,
                            builder: (context) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: DrawerComponent(),
                                    flex: 7,
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          color: Colors.transparent,
                                        )),
                                    flex: 3,
                                  ),
                                ],
                              );
                            });
                      },
                      child: Icon(Icons.menu));
                }),
                middle: Text(
                  'Platform Convertor App',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black),
                ),
                trailing: CupertinoSwitch(
                    value: Globals.isIos,
                    onChanged: (val) {
                      setState(() {
                        Globals.isIos = val;
                      });
                    }),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 90),
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    IndexedStack(
                      index: currentCupertinoIndex,
                      children: [
                        ChatsComponents(),
                        CallsComponents(),
                        SettingsComponents(),
                      ],
                    ),
                    CupertinoTabBar(
                      currentIndex: currentCupertinoIndex,
                      onTap: (val) {
                        setState(() {
                          currentCupertinoIndex = val;
                        });
                      },
                      items: [
                        BottomNavigationBarItem(
                          label: "Chats",
                          icon: Icon(CupertinoIcons.chat_bubble_2),
                        ),
                        BottomNavigationBarItem(
                          label: "Calls",
                          icon: Icon(CupertinoIcons.phone),
                        ),
                        BottomNavigationBarItem(
                          label: "Settings",
                          icon: Icon(CupertinoIcons.settings),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
