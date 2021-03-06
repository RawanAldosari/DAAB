import 'package:daab/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../CustomPageRoute.dart';
import '../decision_tree.dart';
import 'student_home.dart';
// import 'moneyVFeed.dart';

// class vHomeA extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<
//         AllDonationVM
//     >(
//         create: (_) => AllDonationVM(), child: vHome());
//   }
// }

class sHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<sHome> {
  // the default location which the user will be in:
  int _currentIndex = 0;
  String _title = "الصفحة الرئيسية";

  // nav bar redirection:
  final List<Widget> _children = [
    // VolunteerProfile(),
    // SubscribedList(),
    // MapScreen(),
    // SearchPage(),
    shome()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors.second,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          // title: Text(
          //   _title,
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     color: colors.main,
          //     fontWeight: FontWeight.w700,
          //     fontFamily: 'Tajawal',
          //     fontSize: 24,
          //   ),
          // ),
          elevation: 0,
          leading: IconButton(
            onPressed: () async {
              // AllDonationVM donationsVM = AllDonationVM();
              // await donationsVM
              //     .usersDonations(FirebaseAuth.instance.currentUser!.uid);
              // Navigator.of(context).push(CustomPageRoute(
              //     child: donationsView()));
            },
            icon: Icon(Icons.person),
            padding: const EdgeInsets.only(
              left: 20,
            ),
            color: colors.main,
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                icon: Icon(
                  Icons.logout,
                  color: colors.main,
                ),
                onPressed: () async {
                  showDialog(
                      builder: (ctxt) {
                        return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(32.0))),
                            contentPadding: EdgeInsets.only(
                                right: 20.w, top: 20.h, bottom: 10.h),
                            title: Text(
                              "تسجيل الخروج",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: colors.main,
                                fontFamily: 'Tajawal',
                              ),
                            ),
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    "هل أنت متأكد من رغبتك في\nتسجيل الخروج؟",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(fontFamily: "Tajawal"),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ElevatedButton(
                                      child: const Text(
                                        "إلغاء",
                                        style: TextStyle(
                                            color: colors.main,
                                            fontFamily: "Tajawal"),
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color(0xdeffffff)),
                                          elevation:
                                          MaterialStateProperty.all<double>(
                                              0)),
                                      onPressed: () {
                                        Navigator.of(context).pop(context);
                                      },
                                    ),
                                    ElevatedButton(
                                      child: Text(
                                        "تأكيد",
                                        style: TextStyle(fontFamily: "Tajawal"),
                                      ),
                                      onPressed: () async {
                                        await FirebaseAuth.instance.signOut();
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DecisionsTree()));
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              colors.main)),
                                    )
                                  ],
                                ),
                              ],
                            ));
                      },
                      context: context);
                },
              ),
            )
          ],
          //automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          bottomOpacity: 30,
          // elevation: 1,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
          ),
        ),
        body: shome(),
        extendBody: true,
        // bottomNavigationBar:
        // Container(
        //   // height: 90,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.only(
        //         topRight: Radius.circular(50), topLeft: Radius.circular(50)),
        //     boxShadow: [
        //       BoxShadow(
        //           color: Color(0xffededed), spreadRadius: 0, blurRadius: 10),
        //     ],
        //   ),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(50),
        //       topRight: Radius.circular(50),
        //     ),
        //     child: BottomNavigationBar(
        //         backgroundColor: Colors.white,
        //         iconSize: 30,
        //         selectedItemColor: const Color(0xdeedd03c),
        //         unselectedItemColor: const Color(0xff334856),
        //         selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        //         showSelectedLabels: false,
        //         showUnselectedLabels: false,
        //         onTap: onTabTapped,
        //         currentIndex: _currentIndex,
        //         items: [
        //           BottomNavigationBarItem(
        //             icon: new Icon(Icons.person),
        //             label: "الملف الشخصي",
        //           ),
        //           BottomNavigationBarItem(
        //             icon: new Icon(Icons.article_outlined),
        //             label: "المتابَعين",
        //           ),
        //           BottomNavigationBarItem(
        //             icon: new Icon(Icons.map_rounded),
        //             label: "الخريطة",
        //           ),
        //           BottomNavigationBarItem(
        //             icon: new Icon(Icons.search),
        //             label: "البحث",
        //           ),
        //           BottomNavigationBarItem(
        //             icon: new Icon(Icons.home),
        //             label: "الصفحة الرئيسية",
        //           ),
        //         ]),
        //   ),
        // )
    );
  }

  logout_() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => DecisionsTree()));
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          {
            _title = "الملف الشخصي";
          }
          break;
        case 1:
          {
            _title = 'قائمة المتابَعين';
          }
          break;
        case 2:
          {
            _title = 'الخريطة';
          }
          break;
        case 3:
          {
            _title = 'البحث';
          }
          break;
        case 4:
          {
            _title = 'الصفحة الرئيسية';
          }
          break;
      }
    });
  }
}
