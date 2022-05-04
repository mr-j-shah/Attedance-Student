import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onlineid/profile/profilepage.dart';

class user {
  static final user _currentUser = user._internal();
  String? name;
  String? number;
  String? dob;
  String? blood;
  String? department;
  String? email;
  String? phone;
  String? location;
  factory user() {
    return _currentUser;
  }

  user._internal();
}

class Lectur {
  String? Date;
  String? Semester;
  String? Email;
  String? Subject;
  String? Time;
  Future<void> attend(Map<String, dynamic> userMap) async {
    this.Subject = userMap['Subject'];
    this.Semester = userMap['Semester'];
    this.Email = userMap['Email'];
    this.Date = userMap['Date'];
    this.Time = userMap['Time'];
  }
}
