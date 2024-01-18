import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  String targetScreen;
  bool active;
  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  /// Convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      "ImageUrl": imageUrl,
      "TargetScreen": targetScreen,
      "Active": active,
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    /// Map Json Record to the Model
    return BannerModel(
      imageUrl: data["ImageUrl"] ?? "",
      targetScreen: data["TargetScreen"] ?? "",
      active: data["Active"] ?? false,
    );
  }
}
