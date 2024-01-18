import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zone_store/features/shop/models/category_model.dart';
import 'package:zone_store/utils/exceptions/firebase_exceptions.dart';
import 'package:zone_store/utils/exceptions/format_exceptions.dart';
import 'package:zone_store/utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get All Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection("Categories").get();

      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /// Get Sub Categories
  /// Upload Categories to the Cloud Firebase
// Future<void> uploadDummyData(List<CategoryModel> categories)async{
//   try {
//     final storage =Get.put(TFirebaseStora)
// for (var category in categories) {
//   final file=await storage.g
//   final url = await sto
//   category.image =url;
//   await _db.collection("Categories").doc(category.id).set(category.toJson());
// }
//     } on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const TFormatException();
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       throw "Something went wrong. Please try again";
//     }
// }
}
