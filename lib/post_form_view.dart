import 'package:daab/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'club_home.dart';
import 'post_form.dart';

class PostRequest extends StatefulWidget {
  PostRequest.ensureInitialized();
  const PostRequest({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _PostRequestState();
  }
}

class _PostRequestState extends State<PostRequest> {
  final List<Widget> _children = [
    cHome(),
    PostRequest(),
  ];

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    bool portrait = true;

    if (deviceOrientation == Orientation.landscape) portrait = false;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          backgroundColor: const Color(0xffededed),
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                    ),
                    Text(
                      'نموذج إضافة اعلان جديد',
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: colors.main,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: portrait == true ? 15.h : 20.h),
                    Container(
                      // height: portrait == true ? 580.h : 1100.h,
                      width: portrait == true ? 330.w : 280.w,
                      padding:
                      const EdgeInsets.only(left: 12, right: 12, top: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(0xffffffff),
                        border: Border.all(
                            width: 0.5, color: const Color(0xffdfdfdf)),
                      ),
                      child: PostRequestForm(),
                    ),
                    SizedBox(height: portrait == true ? 120.h : 230.h),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
