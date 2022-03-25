import 'package:daab/Colors.dart';
import 'package:daab/clubs_home_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'decision_tree.dart';
import 'feed_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class cHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<cHome> {
  // the default location which the user will be in:
  int _currentIndex = 2;
  String _title = "الصفحة الرئيسية";

  // nav bar redirection:
  final List<Widget> _children = [
    profile(),
    profile2(),
    ClubHomeFeed(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffededed),
        appBar: AppBar(
          centerTitle: true,
          //  actions: [
          //   // IconButton(onPressed: (){
          // //      FirebaseAuth.instance.signOut().then((value) {
          //    //     Navigator.pushAndRemoveUntil(context,       MaterialPageRoute<void>(
          //        //            builder: (BuildContext context) =>  UsersScreen(),
          //           //      ), (route) => false);
          //     //  });

          //   //  }, icon: Icon(Icons.logout))
          //  ],
          automaticallyImplyLeading: false,
          title: Text(
            _title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colors.main,
              fontWeight: FontWeight.w700,
              fontFamily: 'Tajawal',
              fontSize: 24,
            ),
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
                                            color: const Color(0xdeedd03c),
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
                                              const Color(0xdeedd03c))),
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
          // automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          // bottomOpacity: 30,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
          ),
        ),
        body:
        // MultiProvider(providers: [
        //   ChangeNotifierProvider(
        //     create: (_) => FeedViewModel(),
        //   )
        // ], child:
        _children[_currentIndex],
        // ),
        // cHome(),
        extendBody: true,
        bottomNavigationBar: Container(
          // height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50), topLeft: Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                  color: Color(0xffededed), spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            child: BottomNavigationBar(
                backgroundColor: Colors.white,
                iconSize: 30,
                selectedItemColor: const Color(0xdeedd03c),
                unselectedItemColor: const Color(0xff334856),
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: onTabTapped,
                currentIndex: _currentIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.person),
                    label: "الملف الشخصي",
                  ),
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.add),
                    label: "إضافة طلب",
                  ),
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.home),
                    label: "الصفحة الرئيسية",
                  ),
                ]),
          ),
        )
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'ملف المسجد';
          }
          break;
        case 1:
          {
            _title = 'إضافة طلب';
          }
          break;
        case 2:
          {
            _title = 'الصفحة الرئيسية';
          }
          break;
      }
    });
  }
}

class profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

class profile2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}