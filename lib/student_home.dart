import 'package:daab/Colors.dart';
import 'package:daab/clubs_feed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:swe444/Functions/home_screen/moneyVFeed.dart';

import '../CustomPageRoute.dart';
import 'package:daab/decision_tree.dart';

import 'events_feed.dart';

class shome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _shome();
  }
}

class _shome extends State<shome> {
  var types = [
    Type("الأندية الطلابية", "images/clubs-2.png", 1),
    Type("الفعاليات", "images/Events.png", 2),
    // Type("تطوير المهارات", "images/personal_skills_2.png", 3)
  ];
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: const Color(0xfff1f1f1),
  //     body: Center(
  //       child: ListView.builder(
  //         shrinkWrap: true,
  //         itemCount: type.length,
  //         itemBuilder: (context, index) {
  //           return GestureDetector(
  //             onTap: () {
  //               if (type[index].num == 1) {
  //                 // Navigator.of(context)
  //                 //     .push(CustomPageRoute(child: clubsSFeed()));
  //               } else if (type[index].num == 2) {
  //                 // Navigator.of(context)
  //                 //     .push(CustomPageRoute(child: activitiesSFeed()));
  //               } else {
  //                 // Navigator.of(context)
  //                 //     .push(CustomPageRoute(child:
  //                 // skillSFeed()
  //                 // ));
  //               }
  //             },
  //             child: Container(
  //               child: Padding(
  //                 padding:
  //                 const EdgeInsets.only(left: 20.0, right: 20, top: 20),
  //                 child: Stack(
  //                   children: [
  //                     Container(
  //                       height: 140,
  //                       decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(19.0),
  //                           gradient: LinearGradient(
  //                             colors: [Color(0xffffffff), Color(0xdef3f1e9)],
  //                             begin: Alignment.topLeft,
  //                             end: Alignment.bottomRight,
  //                           ),
  //                           boxShadow: [
  //                             BoxShadow(
  //                               color: Color(0xffc6c2c2),
  //                               blurRadius: 7,
  //                               offset: Offset(0, 1),
  //                             ),
  //                           ]),
  //                     ),
  //                     Row(
  //                       children: [
  //                         Padding(
  //                           padding: const EdgeInsets.only(top: 25.0, left: 10),
  //                           child: Image.asset(
  //                             type[index].image.toString(),
  //                             height: 90,
  //                             width: 120,
  //                           ),
  //                         ),
  //                         Spacer(),
  //                         Padding(
  //                           padding:
  //                           const EdgeInsets.only(right: 50.0, top: 18.0),
  //                           child: Text(
  //                             type[index].type.toString(),
  //                             textAlign: TextAlign.center,
  //                             style: TextStyle(
  //                               color: Color(0xff334856),
  //                               fontWeight: FontWeight.w700,
  //                               fontFamily: 'Tajawal',
  //                               fontSize: 22,
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // } //build

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff6f6f6),
      child: Column(
        children: [
          Container(
            height: 180,
            child: Stack(children: [
              Container(
                color: colors.second,
                height: 150,
                padding: EdgeInsets.only(right: 36, top: 12),
                width: double.infinity,
                child: Column(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(textDirection: TextDirection.rtl, children: [
                      Text(
                        'اهلًا بك',
                        style: TextStyle(
                          color: colors.darkText,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Tajawal',
                          fontSize: 28,
                        ),
                      ),
                      Text(
                        ',',
                        style: TextStyle(
                          color: colors.darkText,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Tajawal',
                          fontSize: 28,
                        ),
                      ),
                    ]),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Padding(padding: EdgeInsets.only(right: 40)),
                        Text(
                          'روان الدوسري',
                          style: TextStyle(
                            color: colors.darkText,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Tajawal',
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: colors.main,
                        ),
                        // Wrap the IconButton in a Material widget for the
                        // IconButton's splash to render above the container.
                        child: Material(
                          borderRadius: BorderRadius.circular(32),
                          type: MaterialType.transparency,
                          // Hard Edge makes sure the splash is clipped at the border of this
                          // Material widget, which is circular due to the radius above.
                          clipBehavior: Clip.hardEdge,
                          child: IconButton(
                            padding: EdgeInsets.all(16),
                            color: Colors.white,
                            iconSize: 32,
                            icon: Icon(
                              Icons.calendar_today,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                showAlertDialog();
                              },
                              child: Text(
                                "56",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Tajawal",
                                    fontSize: 25),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                showAlertDialog();
                              },
                              child: SizedBox(width: 32),
                            ),
                            GestureDetector(
                              onTap: () async {
                                showAlertDialog();
                              },
                              child: Text(
                                'الساعات',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Tajawal",
                                    fontSize: 22),
                              ),
                            )
                          ],
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        decoration: BoxDecoration(
                            color: colors.main,
                            borderRadius: BorderRadius.circular(32)),
                      ),
                    ]),
              )
            ]),
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Container()
              // SearchBar(),
              ),
          Expanded(
            child: ListView(
              shrinkWrap: false,
              physics: ScrollPhysics(),
              children: [
                ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: types.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (types[index].num == 1) {
                          Navigator.of(context)
                              .push(CustomPageRoute(child: clubsFeed()));
                        } else if (types[index].num == 2) {
                          Navigator.of(context)
                              .push(CustomPageRoute(child: eventsFeed()));
                        } else {
                          // Navigator.of(context)
                          //     .push(CustomPageRoute(child: eventsVFeed()));
                        }
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, top: 20),
                          child: Stack(
                            children: [
                              Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19.0),
                                    color: Colors.white,
                                    // gradient: LinearGradient(
                                    //   colors: [Color(0xffffffff), Color(0xdef3f1e9)],
                                    //   begin: Alignment.topLeft,
                                    //   end: Alignment.bottomRight,
                                    // ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xffc6c2c2),
                                        blurRadius: 7,
                                        offset: Offset(0, 1),
                                      ),
                                    ]),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 18.0, left: 10),
                                    child: Image.asset(
                                      types[index].image.toString(),
                                      height: 100,
                                      width: 130,
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 50.0, top: 18.0),
                                    child: Text(
                                      types[index].type.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: colors.darkText,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Tajawal',
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Container(
                    margin: const EdgeInsets.only(top: 50.0, bottom: 20),
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                        onTap: () async {},
                        child: const Text(
                          "الاسئلة الشائعة",
                          style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                              color: Color(0xff8b8b8b)),
                        )))
              ],
            ),
          )
        ],
      ),
    );
  }

  showAlertDialog() {
    Widget cancelButton = Padding(
        padding: EdgeInsets.only(right: 90.w),
        child: ElevatedButton(
          child: const Text(
            "تم",
            style: TextStyle(fontFamily: "Tajawal", color: colors.main),
          ),
          onPressed: () {
            Navigator.of(context).pop(context);
          },
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xdeffffff)),
              elevation: MaterialStateProperty.all<double>(0)),
        ));

    // Widget confirmButton = Padding(
    //   padding: EdgeInsets.only(right: 40.w, top: 20.h, bottom: 30.h),
    //   child: ElevatedButton(
    //     child: Text(
    //       "تأكيد",
    //       style: TextStyle(fontFamily: "Tajawal"),
    //     ),
    //     style: ButtonStyle(
    //         backgroundColor:
    //         MaterialStateProperty.all<Color>(const Color(0xdeedd03c))),
    //     onPressed: () async {
    //       Navigator.of(context).pop(context);
    //       await requestVM.cancelRequest(document);
    //       Snackbar bar =
    //       Snackbar(context, requestVM.message, requestVM.msgType);
    //       bar.showToast();
    //     },
    //   ),
    // );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      contentPadding: EdgeInsets.only(right: 20.w, top: 20.h, bottom: 10.h),
      title: Text(
        "نجاح",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "Tajawal",
          color: colors.main,
        ),
      ),
      content: Text(
        "تم ارسال طلب \n استلام السجل المهاري بنجاح",
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: "Tajawal"),
      ),
      actions: [
        cancelButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class Type {
  String? type;
  String? image;
  int? num;
  Type(this.type, this.image, this.num);
} //
