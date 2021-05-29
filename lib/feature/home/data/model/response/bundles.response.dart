class BundleListResponse {
  List<BundleResponse> bundles = [];

  BundleListResponse({required this.bundles});

  BundleListResponse.fromJson(Map<String, dynamic> json) {
    if (json['bundles'] != null) {
      bundles = <BundleResponse>[];
      json['bundles'].forEach((v) {
        bundles.add(new BundleResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_null_comparison
    if (this.bundles != null) {
      data['bundles'] = this.bundles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BundleResponse {
  String? id;
  String? name;
  int? status;
  bool? private;
  String? flowId;

  BundleResponse({this.id, this.name, this.status, this.private, this.flowId});

  BundleResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    private = json['private'];
    flowId = json['flowId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['private'] = this.private;
    data['flowId'] = this.flowId;
    return data;
  }
}
