import 'package:rocketbase/core/base/base.repository.dart';
import 'package:rocketbase/feature/scheduling/data/model/dto/bundles.dto.dart';
import 'package:rocketbase/feature/scheduling/data/service/local/bundles.services.mock.dart';
import 'package:rocketbase/feature/scheduling/domain/mapper/bundle.response.mapper.dart';

class BundleRepository extends BaseRepository {
  Future<BundleListDto> getBundleList(String searchQuery) async {
    await Future.delayed(new Duration(milliseconds: 500));
    var response = BundleMock.getItems(searchQuery);
    var mapperResult = ToBundleListDto.mapper(response);
    return mapperResult;
  }
}
