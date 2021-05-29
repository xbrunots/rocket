import 'package:rocketbase/core/base/base.viewmodel.dart';
import 'package:rocketbase/feature/home/data/model/dto/bundles.dto.dart';
import 'package:rocketbase/feature/home/domain/bundles.usecase.dart';
import 'package:rx_notifier/rx_notifier.dart';

class BundleViewModel extends ViewModel<BundleListDto> {
  late BundleListUseCase bundleListUseCase;

  BundleViewModel() {
    bundleListUseCase = BundleListUseCase();
  }

  RxNotifier<BundleListDto> bundleList =
      RxNotifier<BundleListDto>(BundleListDto(bundles: []));

  Future getListLocations(String query) async {
    loadingInProgress = true;
    var response = await bundleListUseCase.listLocations(query);
    loadingInProgress = false;
    bundleList.value = response;
    liveData.value = response;
    return null;
  }

  void dispose() {
    bundleList.dispose();
    mainDispose();
  }
}
