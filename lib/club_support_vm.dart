import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'applicant.dart';
// import 'package:swe444/Models/members.dart';
// import 'package:swe444/Models/support.dart';

class RequestViewModel {
  String? clubID;
  String? _description;
  String? _title;
  String? _club_name;
  String? _club_location;
  DateTime? _upload_time;
  late String message;
  late String msgType;
  String? _duration;

  // تنظيم
  DateTime? _startDate, _endDate;
  String? _startTime, _endTime;
  int? _partNum;
  int _participants = 0;

  get userDocument {
    return FirebaseFirestore.instance.collection("users").doc(clubID).get();
  }

  set setClubID(String? value) {
    if (value != null) {
      clubID = value;
    }
  }

  set duration(String? value) {
    if (value != null) {
      _duration = value;
    }
  }

  set setDescription(String? value) {
    if (value != null) {
      _description = value;
    }
  }

  set setTitle(String? value) {
    if (value != null) {
      _title = value;
    }
  }

  set setCName(String? value) {
    if (value != null) {
      _club_name = value;
    }
  }

  set setCLocation(String? value) {
    if (value != null) {
      _club_location = value;
    }
  }

  set setUploadTime(DateTime? value) {
    if (value != null) {
      _upload_time = value;
    }
  }



  // organz requests
  set setPartNum(int? value) {
    if (value != null) {
      _partNum = value;
    }
  }

  set setPart(int? value) {
    if (value != null) {
      _participants = value;
    }
  }

  set setStartDate(DateTime? value) {
    if (value != null) {
      _startDate = value;
    }
  }

  set setEndDate(DateTime? value) {
    if (value != null) {
      _endDate = value;
    }
  }

  set setStartTime(String? value) {
    if (value != null) {
      _startTime = value;
    }
  }

  set setEndTime(String? value) {
    if (value != null) {
      _endTime = value;
    }
  }

  /// items requests

  // set setItem(String? value) {
  //   if (value != null) {
  //     _item = value;
  //   }
  // }

  // set setRequested(int? value) {
  //   if (value != null) {
  //     _requested = value;
  //   }
  // }

  Future<void> addSupport() async {
    String _message = "";
    String _msgtype = "";

      ClubSupport request = ClubSupport(clubID, _title, _description, _club_name, _club_location, _upload_time, _duration);

      await FirebaseFirestore.instance
          .collection('clubSupport')
          .add(request.toJson())
          .then((value) =>
      {_message = 'تمت إضافة الطلب بنجاح', _msgtype = "success"})
          .catchError((error) =>
      {_message = " فشل في إضافة الطلب:" + error, _msgtype = "fail"});

    // else if (_type == "موارد") {
    //   ItemsRequest request = ItemsRequest(
    //     // item: _item,
    //       type: _type,
    //       donated: _donated,
    //       amount: _requested,
    //       posted_by: _posted_by,
    //       description: _description,
    //       mosque_name: _mosque_name,
    //       mosque_location: _mosque_location,
    //       title: _title,
    //       uplaod_time: _uplaod_time,
    //       token: _token);
    //
    //   await FirebaseFirestore.instance
    //       .collection('requests')
    //       .add(request.toJson())
    //       .then((value) =>
    //   {_message = 'تمت إضافة الطلب بنجاح', _msgtype = "success"})
    //       .catchError((error) =>
    //   {_message = " فشل في إضافة الطلب:" + error, _msgtype = "fail"});
    // } else if (_type == "تنظيم") {
    //   // final now = new DateTime.now();
    //   // DateTime _startTime2= new DateTime(now.year, now.month, now.day, _startTime!.hour, _startTime!.minute);
    //   // final shours = _startTime!.hour.toString().padLeft(2, '0');
    //   // final sminutes = _startTime!.minute.toString().padLeft(2, '0');
    //   //
    //   // String _startTimes = '$shours:$sminutes';
    //   //
    //   // final ehours = _startTime!.hour.toString().padLeft(2, '0');
    //   // final eminutes = _startTime!.minute.toString().padLeft(2, '0');
    //   //
    //   // String _endTimes = '$ehours:$eminutes';
    //
    //   VolnRequest request = VolnRequest(
    //       type: _type,
    //       number: _partNum,
    //       participants: _participants,
    //       days: daysBetween(_startDate, _endDate),
    //       startDate: _startDate,
    //       endDate: _endDate,
    //       startTime: _startTime,
    //       endTime: _endTime,
    //       posted_by: _posted_by,
    //       description: _description,
    //       mosque_name: _mosque_name,
    //       mosque_location: _mosque_location,
    //       title: _title,
    //       uplaod_time: _uplaod_time,
    //       token: _token);
    //
    //   await FirebaseFirestore.instance
    //       .collection('requests')
    //       .add(request.toJson())
    //       .then((value) =>
    //   {_message = 'تمت إضافة الطلب بنجاح', _msgtype = "success"})
    //       .catchError((error) => {
    //     _message = " فشل في إضافة الطلب:" + error.toString(),
    //     _msgtype = "fail"
    //   });
    // }

    message = _message;
    msgType = _msgtype;
  }

  Future<void> addEvent() async {
    String _message = "";
    String _msgtype = "";

      // final now = new DateTime.now();
      // DateTime _startTime2= new DateTime(now.year, now.month, now.day, _startTime!.hour, _startTime!.minute);
      // final shours = _startTime!.hour.toString().padLeft(2, '0');
      // final sminutes = _startTime!.minute.toString().padLeft(2, '0');
      //
      // String _startTimes = '$shours:$sminutes';
      //
      // final ehours = _startTime!.hour.toString().padLeft(2, '0');
      // final eminutes = _startTime!.minute.toString().padLeft(2, '0');
      //
      // String _endTimes = '$ehours:$eminutes';

    Events request =  Events(_partNum, _participants, daysBetween(_startDate, _endDate),
        _startDate, _endDate, _startTime,
        _endTime, clubID, _title, _description, _club_name,
        _club_location, _upload_time);


    await FirebaseFirestore.instance
          .collection('events')
          .add(request.toJson())
          .then((value) =>
      {_message = 'تمت إضافة الطلب بنجاح', _msgtype = "success"})
          .catchError((error) => {
        _message = " فشل في إضافة الطلب:" + error.toString(),
        _msgtype = "fail"
      });


    message = _message;
    msgType = _msgtype;
  }





  int daysBetween(DateTime? from, DateTime? to) {
    if (from != null && to != null) {
      from = DateTime(from.year, from.month, from.day);
      to = DateTime(to.year, to.month, to.day);
      int diff = to.difference(from).inDays;
      if (diff == 0)
        return 1;
      else
        return diff + 1;
    } else
      return 0;
  }

  // Future donateItem(DocumentSnapshot document, String amount) async {
  //   String _message = "";
  //   String _msgtype = "";
  //   int? items=  int.parse(amount);
  //
  //     FundsRequest request = FundsRequest(
  //         type: document['type'],
  //         donated: items,
  //         amount: int.parse(document['amount']),
  //         posted_by: document['posted_by'],
  //         description: document['description'],
  //         mosque_name: document['mosque_name'],
  //         mosque_location: document['mosque_location'],
  //         title: document['title'],
  //         uplaod_time: document['upload_time'], token: document['token']);
  //
  //     await FirebaseFirestore.instance
  //         .collection('requests')
  //         .doc(document.id)
  //         .set(request.toJson())
  //         .then((value) =>
  //     {_message = 'تم تسجيل التبرع بنجاح', _msgtype = "success"})
  //         .catchError((error) =>
  //     {_message = " فشل في تسجيل التبرع" + error, _msgtype = "fail"});
  //
  //
  //   message = _message;
  //   msgType = _msgtype;
  // }

  // Future applyAsMember(
  //     DocumentSnapshot document, String amount, User user) async {
  //   String _message = "";
  //   String _msgtype = "";
  //   int? items = int.parse(amount);
  //   if (user != null) {
  //     var userDoc = await FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(user.uid.toString())
  //         .get();
  //     String firstName = userDoc['first_name'].toString().trim();
  //     String lastName = userDoc['last_name'].toString().trim();
  //
  //     Applicant application = new Applicant("unconfirmed", firstName + " " + lastName,user.uid.toString(),DateTime.now());
  //
  //     ItemsRequest request = ItemsRequest(
  //         type: document['type'],
  //         donated: int.parse(document['donated'].toString()) + items,
  //         amount: int.parse(document['amount_requested'].toString()),
  //         posted_by: document['posted_by'],
  //         description: document['description'],
  //         mosque_name: document['mosque_name'],
  //         mosque_location: document['mosque_location'],
  //         title: document['title'],
  //         uplaod_time: (document['uplaod_time'] as Timestamp).toDate(),
  //         token: document['token']);
  //
  //     await FirebaseFirestore.instance
  //         .collection('requests')
  //         .doc(document.id)
  //         .collection('donations')
  //         .add(donation.toJson())
  //         .then((value) async => {
  //       await FirebaseFirestore.instance
  //           .collection('requests')
  //           .doc(document.id)
  //           .set(request.toJson())
  //           .then((value) => {
  //         _message = 'تم تسجيل التبرع بنجاح',
  //         _msgtype = "success"
  //       })
  //           .catchError((error) => {
  //         _message = " فشل في تسجيل التبرع" + error,
  //         _msgtype = "fail"
  //       }),
  //     })
  //         .catchError((error) => {
  //       _message = " فشل في تسجيل التبرع" + error,
  //       _msgtype = "fail",
  //     });
  //
  //     message = _message;
  //     msgType = _msgtype;
  //   }
  // }

  // Future cancelRequest(DocumentSnapshot document) async {
  //   String _message = "";
  //   String _msgtype = "";
  //
  //   return await FirebaseFirestore.instance
  //       .collection('requests')
  //       .doc(document.id)
  //       .delete()
  //       .then((value) {
  //     _message = "تم إلغاء الطلب بنجاح";
  //     _msgtype = "success";
  //     msgType = _msgtype;
  //     message = _message;
  //   }).catchError((error) {
  //     _message = "فشل في إلغاء الطلب";
  //     _msgtype = "fail";
  //     msgType = _msgtype;
  //     message = _message;
  //   });
  // }
}
