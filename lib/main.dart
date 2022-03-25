import 'package:daab/student_home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'Functions/decision_tree.dart';
import 'package:get/get.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseFirestore.instance.settings =
  const Settings(persistenceEnabled: false);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: sHome(),
        theme: ThemeData(fontFamily: 'Tajawal'),
      ),
      designSize: const Size(390, 844),
    );
  }
}
