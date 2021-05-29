import 'package:rocketbase/core/extensions/null.extentions.dart';
import 'package:rocketbase/feature/home/data/model/response/bundles.response.dart';

class BundleMock {
  static BundleListResponse getItems(String searchQuery) {
    var mock = [
      BundleResponse(name: "Criar lista fake", id: "Modelo"),
      BundleResponse(name: "Editar lista", id: "Dos Artistas"),
      BundleResponse(name: "deletar lista", id: "Malibu"),
      BundleResponse(name: "Criar lista fake", id: "Xaplau"),
      BundleResponse(name: "Criar lista fake", id: "AR"),
      BundleResponse(name: "Criar lista fake", id: "REA"),
      BundleResponse(name: "Criar lista fake", id: "GFDS"),
      BundleResponse(name: "Criar lista fake", id: "PAOSL"),
      BundleResponse(name: "Criar lista fake", id: "Clinica Modelo"),
      BundleResponse(name: "Criar lista fake", id: "AS1"),
      BundleResponse(name: "Criar lista fake", id: "Clinica Nicola Tesla"),
    ];

    var mockFiltered = mock;
    try {
      if (Strings.safe(searchQuery).isNotEmpty) {
        print(searchQuery);
        mockFiltered = mock
            .where((x) => (x.name! + x.id!)
                .toLowerCase()
                .contains(searchQuery.toLowerCase()))
            .toList();
      }
    } on Exception catch (e) {
      print(e);
    }

    var response = BundleListResponse(bundles: mockFiltered);
    return response;
  }
}
