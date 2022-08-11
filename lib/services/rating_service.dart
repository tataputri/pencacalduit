import 'package:in_app_review/in_app_review.dart';

class RatingService {
  static String packageName = "com.firemaxfutebol.dahora.nop";

  final InAppReview _inAppReview = InAppReview.instance;

  Future<bool> showRating() async {
    try {
      final available = await _inAppReview.isAvailable();
      if (available) {
        _inAppReview.requestReview();
      } else {
        _inAppReview.openStoreListing(
          appStoreId: "com.firemaxfutebol.dahora.nop",
        );
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
