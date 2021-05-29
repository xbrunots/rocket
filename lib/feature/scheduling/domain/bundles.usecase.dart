import 'package:rocketbase/core/domain/observable.usecase.dart';
import 'package:rocketbase/feature/scheduling/data/model/dto/bundles.dto.dart';
import 'package:rocketbase/feature/scheduling/data/repository/bundle.repository.dart';
import 'package:rocketbase/feature/scheduling/presentation/viewmodel/bundle.viewmodel.dart';

class BundleListUseCase extends Observable<BundleViewModel> {
  late BundleRepository repository;

  BundleListUseCase() {
    repository = BundleRepository();
  }

  Future<BundleListDto> listLocations(String query) async {
    var response = await repository.getBundleList(query);
    return response;
  }
}
