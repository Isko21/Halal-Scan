import 'package:cloud_firestore/cloud_firestore.dart';

class CustomUser {
  final String uid;
  final String fullName;
  final String photoUrl;
  final bool isReviewer;
  final Timestamp memberSince;

  CustomUser({
    required this.uid,
    required this.fullName,
    required this.photoUrl,
    required this.isReviewer,
    required this.memberSince,
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
      isReviewer: json['isReviewer'],
      memberSince: json['memberSince']);
}
