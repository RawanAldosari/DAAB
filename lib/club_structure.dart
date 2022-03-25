import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daab/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'club_home.dart';
import 'feed_view_model.dart';
import 'post_form.dart';


class ClubStructureSet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FeedViewModel>(
        create: (_) => FeedViewModel(),
        child: Container(height: 1200, width: 450, child: ClubStructure()));
  }
}

class ClubStructure extends StatefulWidget {
  ClubStructure.ensureInitialized();
  const ClubStructure({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ClubStructureState();
  }
}

class _ClubStructureState extends State<ClubStructure> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration.zero,
            () => setState(() {
          setup();
        }));
  }

  setup() async {
    await Provider.of<FeedViewModel>(context, listen: false).fetchMembers();
  }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot<Map<String, dynamic>>>? members =
        Provider.of<FeedViewModel>(context, listen: false).members;
    final deviceOrientation = MediaQuery.of(context).orientation;
    bool portrait = true;

    if (deviceOrientation == Orientation.landscape) portrait = false;

    return Scaffold(
      backgroundColor: const Color(0xffededed),
      body: StreamBuilder(
          stream: members,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return _buildWaitingScreen();
            if ((snapshot.data! as QuerySnapshot).docs.length != 0)
              return ListView.builder(
                itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                itemBuilder: (BuildContext context, int index) => buildCards(
                    context, (snapshot.data! as QuerySnapshot).docs[index]),
              );
            return Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text("لا يوجد تبرعات حتى الآن"),
              ),
            );
          }),
    );

  }

  Widget buildCards(BuildContext context, DocumentSnapshot document) {

      return Container(
        padding:
        const EdgeInsets.only(top: 5.0, bottom: 0, left: 20, right: 20),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.0),
          ),
          shadowColor: Color(0xdef3f1e9),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, bottom: 12.0, left: 2, right: 10),
              child: Row(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5.0, bottom: 5.0, left: 2, right: 10),
                  // child: Container(
                  //   decoration: BoxDecoration(
                  //     boxShadow: [
                  //       BoxShadow(
                  //           color: Color(0xffededed),
                  //           spreadRadius: 1,
                  //           blurRadius: 10),
                  //     ],
                  //   ),
                  //   height: 30,
                  //   width: 65,
                  //   child: ElevatedButton(
                  //     onPressed: () async {
                  //       // await FirebaseFirestore.instance
                  //       //     .collection('requests')
                  //       //     .doc(widget.document.id)
                  //       //     .collection("donations")
                  //       //     .doc(document.id)
                  //       //     .set({
                  //       //   'date': document['date'],
                  //       //   'donated_by': document['donated_by'],
                  //       //   'num_of_items': document['num_of_items'],
                  //       //   'uid': document['uid'],
                  //       //   'status': "confirmed"
                  //       // });
                  //     },
                  //     child: Text(
                  //       "وصل",
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //           fontFamily: 'Tajawal',
                  //           color: const Color(0xff334856)),
                  //     ),
                  //     style: ElevatedButton.styleFrom(
                  //       minimumSize: Size(65.w, 30.h),
                  //       primary: const Color(0xdeedd03c),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(50),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ),
                const Spacer(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 0, top: 5),
                      child: Text(
                        document['name'].toString(),
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Tajawal'),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 5),
                      child: Row(children: <Widget>[
                        //Text(document['amount_requested'].toString()),

                        Text(document['role'].toString()),
                        SizedBox(width: 10),
                        Text(
                          " الدور",
                          style: TextStyle(fontFamily: 'Tajawal'),
                        ),
                      ]),
                    ),
                  ],
                ),
                Container(
                  child: Icon(
                    Icons.person,
                    size: 35,
                    color: colors.darkText,
                  ),
                ),
              ]),
            ),
          ),
        ),
      );

  }


  Widget _buildWaitingScreen() {
    return Scaffold(
      backgroundColor: const Color(0xffededed),
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: colors.main,
        ),
      ),
    );
  }

}
