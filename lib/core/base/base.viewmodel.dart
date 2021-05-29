import 'package:rx_notifier/rx_notifier.dart';

class ViewModel<T> {
  RxNotifier<bool> loadingInProgressValue = RxNotifier<bool>(false);
  bool get loadingInProgress => loadingInProgressValue.value;
  set loadingInProgress(bool value) {
    loadingInProgressValue.value = value;
  }

  RxNotifier<Exception?> errorInProgressValue = RxNotifier<Exception?>(null);
  Exception? get errorInProgress => errorInProgressValue.value;
  set errorInProgress(Exception? value) {
    errorInProgressValue.value = value;
  }

  RxNotifier<T?> liveData = RxNotifier<T?>(null);

  void mainDispose() {
    errorInProgressValue.dispose();
    loadingInProgressValue.dispose();
  }
}
