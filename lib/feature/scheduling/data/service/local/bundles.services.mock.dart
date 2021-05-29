import 'package:rocketbase/feature/scheduling/data/model/response/bundles.response.dart';

class BundleMock {
  static BundleListResponse getItems(String searchQuery) {
    var response = BundleListResponse(bundles: []);
    return response;
  }
}
