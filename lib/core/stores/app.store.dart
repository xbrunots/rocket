import 'package:mobx/mobx.dart';
part 'app.store.g.dart';

class AppStore = _AppStore with _$AppStore;

//para atualizar o arquivo g roda o comando: flutter packages pub run build_runner build --delete-conflicting-outputs
abstract class _AppStore with Store {
  @observable
  String name = "";
  @observable
  String email = "";
  @observable
  String token = "";
  @observable
  String cep = "";
  @observable
  String cpf = "";

  @action
  void setUser(
    String pName,
    String pEmail,
    String pToken,
    String pCep,
    String pCpf,
  ) {
    name = pName;
    email = pEmail;
    token = pToken;
    cep = pCep;
    cpf = pCpf;
  }

  @observable
  bool loading = false;
  @action
  void setLoading(
    bool pLoading,
  ) {
    loading = pLoading;
  }

  @observable
  bool errors = false;
  String errorMessage = "";
  @action
  void setError(
    bool pErrors,
    String pMessage,
  ) {
    errors = pErrors;
    errorMessage = pMessage;
  }
}
