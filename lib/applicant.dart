import 'package:flutter/material.dart';

class ClubSupport {
  String? clubID;
  // String? type;
  String? description;
  String? title;
  String? club_name;
  String? club_location;
  DateTime? upload_time;
  String? duration;

  ClubSupport(this.clubID, this.title, this.description, this.club_name,
      this.club_location, this.upload_time, this.duration);

  Map<String, dynamic> toJson() => {
        'clubID': clubID,
        'title': title,
        'description': description,
        'club_name': club_name,
        'college': club_location,
        'upload_time': upload_time,
        'duration': duration,
      };

// formatting for upload to Firebase when creating the request

}

class Applicant {
  bool accepted;
  bool confirmed;
  String name;
  String uid;
  DateTime time;

  Applicant(this.accepted, this.confirmed, this.name, this.uid, this.time );

  Map<String, dynamic> toJson() => {
    'accepted': accepted,
    'confirmed': confirmed,
    'name': name,
    'uid': uid,
    'time': time,
  };

// formatting for upload to Firebase when creating the request

}

class ApplicantM {
  bool accepted;
  String name;
  String uid;
  DateTime time;

  ApplicantM(this.accepted, this.name, this.uid, this.time );

  Map<String, dynamic> toJson() => {
    'accepted': accepted,
    'name': name,
    'uid': uid,
    'time': time,
  };

// formatting for upload to Firebase when creating the request

}


class Events {
  int? number;
  int participants = 0;
  DateTime? startDate;
  DateTime? endDate;
  int days;
  String? startTime;
  String? endTime;
  String? clubID;
  // String? type;
  String? description;
  String? title;
  String? club_name;
  String? club_location;
  DateTime? upload_time;
  String? sponsor;


  Events(
      this.number,
      this.participants,
      this.days,
      this.startDate,
      this.endDate,
      this.startTime,
      this.endTime,
      this.clubID,
      this.title,
      this.description,
      this.club_name,
      this.club_location,
      this.upload_time,
      this.sponsor,
      );

  Map<String, dynamic> toJson() => {
        'clubID': clubID,
        'title': title,
        'description': description,
        'club_name': club_name,
        'college': club_location,
        'upload_time': upload_time,
        'days': days,
        'parts_number': number,
        'participants': participants,
        'start_date': startDate,
        'end_date': endDate,
        'start_time': startTime,
        'end_time': endTime,
        'sponsor': sponsor,
      };
}
