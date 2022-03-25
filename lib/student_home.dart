import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:swe444/Functions/home_screen/moneyVFeed.dart';

import '../CustomPageRoute.dart';
import 'package:daab/decision_tree.dart';


class shome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _shome();
  }
}

class _shome extends State<shome> {
  var type = [
    Type("الأندية الطلابية", "images/clubs-2.png", 1),
    Type("الفعاليات", "images/Events.png", 2),
    Type("تطوير المهارات", "images/personal_skills_2.png", 3)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      body: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: type.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (type[index].num == 1) {
                  // Navigator.of(context)
                  //     .push(CustomPageRoute(child: clubsSFeed()));
                } else if (type[index].num == 2) {
                  // Navigator.of(context)
                  //     .push(CustomPageRoute(child: activitiesSFeed()));
                } else {
                  // Navigator.of(context)
                  //     .push(CustomPageRoute(child:
                  // skillSFeed()
                  // ));
                }
              },
              child: Container(
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                  child: Stack(
                    children: [
                      Container(
                        height: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(19.0),
                            gradient: LinearGradient(
                              colors: [Color(0xffffffff), Color(0xdef3f1e9)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
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
                            padding: const EdgeInsets.only(top: 25.0, left: 10),
                            child: Image.asset(
                              type[index].image.toString(),
                              height: 90,
                              width: 120,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding:
                            const EdgeInsets.only(right: 50.0, top: 18.0),
                            child: Text(
                              type[index].type.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff334856),
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
      ),
    );
  } //build

}

class Type {
  String? type;
  String? image;
  int? num;
  Type(this.type, this.image, this.num);
} //
