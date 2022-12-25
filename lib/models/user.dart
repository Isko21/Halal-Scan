import 'package:cloud_firestore/cloud_firestore.dart';

class CustomUser {
  String? uid;
  String? fullName;
  String? email;
  String? photoUrl;
  bool? isReviewer;
  Timestamp? memberSince;

  CustomUser({
    this.uid,
    this.fullName,
    this.email,
    this.photoUrl,
    this.isReviewer = false,
    this.memberSince,
  });

  String? get getUID => uid;
  String? get getFullName => fullName;
  String? get getEmail => email;
  String? get getPhotoUrl => photoUrl;
  bool? get getIsReviewer => isReviewer;
  Timestamp? get getTimeStamp => memberSince;

  void setFullName(String val) {
    fullName = val;
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'fullName': fullName,
        'photoUrl': photoUrl,
        'isReviewer': isReviewer,
        'reviewedAt': memberSince,
      };
  static CustomUser fromJson(Map<String, dynamic> json) => CustomUser(
      uid: json['uid'],
      fullName: json['fullName'],
      photoUrl: json['photoUrl'],
      isReviewer: json['isReviewer'],
      memberSince: json['memberSince']);
}
