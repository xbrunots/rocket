import 'package:rocketbase/core/extensions/null.extentions.dart';
import 'package:rocketbase/feature/home/data/model/dto/bundles.dto.dart';
import 'package:rocketbase/feature/home/data/model/response/bundles.response.dart';

extension ToBundleListDto on BundleListDto {
  static BundleListDto mapper(BundleListResponse response) {
    return BundleListDto(
      bundles: response.bundles.map((e) => ToBundleDto.mapper(e)).toList(),
    );
  }
}

extension ToBundleDto on BundleDto {
  static BundleDto mapper(BundleResponse response) {
    return BundleDto(
      id: Strings.safe(response.id),
      name: Strings.safe(response.name),
      status: Integers.safe(response.status),
      private: Bools.safe(response.private),
      flowId: Strings.safe(response.flowId),
    );
  }
}
