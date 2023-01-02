import 'package:cloud_firestore/cloud_firestore.dart';

class CustomUser {
  String? uid;
  String? fullName;
  String? email;
  String? password;
  String? photoUrl;
  bool? isReviewer;
  Timestamp? memberSince;

  CustomUser({
    this.uid,
    this.fullName,
    this.email,
    this.password,
    this.photoUrl =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8sz484NbeS21UH8wlx9yDd0WROQsCMpS-mvXjkmY&s',
    this.isReviewer = false,
    this.memberSince,
  });

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
      isReviewer: json['isReviewer'] as bool,
      memberSince: json['memberSince']);

  @override
  String toString() =>
      'uid: $uid, fullName" $fullName, email: $email, password: $password, photoUrl: $photoUrl, isReviewer: $isReviewer, memberSince: $memberSince';
}
