import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:zone_store/utils/formatters/formatter.dart';

/// Model class representing user data
class UserModel {
  /// keep those values final which you do not want to update
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// Constructor for UserModel
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// Helper function to get the full name.
  String get fullName => "$firstName $lastName";

  /// Helper function to format phone number
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  /// static function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// static function to generate a username from the full name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername =
        "$firstName$lastName"; // combine first and last name
    String usernameWithPrefix = "cwt_$camelCaseUsername"; // add "cwt_ " prefix
    return usernameWithPrefix;
  }

  /// static function to create an empty user model.
  static UserModel empty() => UserModel(
        id: "",
        firstName: "",
        lastName: "",
        userName: "",
        email: "",
        phoneNumber: "",
        profilePicture: "",
      );

  /// Convert model to json structure for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Username": userName,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "ProfilePicture": profilePicture,
    };
  }

  /// Factory method to create a UserModel from a Firebase document snapshot
  factory UserModel.fromSnapshot(DocumentSnapshot document) {
    var data = document.data() as Map<String, dynamic>;
    return UserModel(
      id: document.id,
      firstName: data["FirstName"] ?? "",
      lastName: data["LastName"] ?? "",
      userName: data["Username"] ?? "",
      email: data["Email"] ?? "",
      phoneNumber: data["PhoneNumber"] ?? "",
      profilePicture: data["ProfilePicture"] ?? "",
    );
  }
}
