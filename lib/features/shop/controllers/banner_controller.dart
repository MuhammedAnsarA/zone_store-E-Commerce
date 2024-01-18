import 'package:get/get.dart';
import 'package:zone_store/data/repositories/banners/banner_repository.dart';
import 'package:zone_store/features/shop/models/banner_model.dart';
import 'package:zone_store/utils/popups/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
  RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  /// Load category data
  Future<void> fetchBanners() async {
    try {
      /// Show Loader while loading categories
      isLoading.value = true;

      /// Fetch Categories from data source (Firestore, API, etc..)
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      /// Update the category list
      this.banners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      /// Remove Loader
      isLoading.value = false;
    }
  }
}
