import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daab/Colors.dart';
import 'package:daab/student_home_view.dart';
import 'package:daab/users_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'club_home.dart';
import 'student_home.dart';

// import 'package:swe444/Functions/home_screen/mm_home_view.dart';
// import 'package:swe444/Functions/home_screen/v_home_view.dart';

class DecisionsTree extends StatefulWidget {
  @override
  _DecisionsTreeState createState() => _DecisionsTreeState();
}

class _DecisionsTreeState extends State<DecisionsTree> {
  //const user = FirebaseAuth.instance.currentUser;
  User? user = FirebaseAuth.instance.currentUser;

  // void getAccess() async{
  //   userId = FirebaseAuth.instance.currentUser!.uid;
  //    document = await FirebaseFirestore.instance.collection('users').doc(userId).get();
  //
  // }

  @override
  void initState() {
    super.initState();
    onRefresh(FirebaseAuth.instance.currentUser);
  }

  onRefresh(userCred) {
    if (mounted) {
      setState(() {
        user = userCred;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return UsersScreen();
    } else {
      // var document;
      String userID = user!.uid;
      FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .get()
          .then((doc) {
        if (doc.exists) {
          Map<String, dynamic>? data = doc.data();
          if (data!['role'] == 'club') {
            Navigator.of(context)
                .push(new MaterialPageRoute(builder: (context) =>
                cHome()
            ));
          } else if (data['role'] == 'student') {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => new
            sHome()));
          }
        } else {
          print('Not Authorized');
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (context) => UsersScreen()));
        }
      });
    } //end outter else
    return _buildWaitingScreen();
    // return UsersScreen();
  }

  Widget _buildWaitingScreen() {
    return Scaffold(
      backgroundColor: const Color(0xffededed),
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: colors.second,
        ),
      ),
    );
  }
}
