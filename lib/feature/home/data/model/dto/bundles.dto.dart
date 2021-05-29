class BundleListDto {
  List<BundleDto> bundles = [];
  BundleListDto({required this.bundles});
}

class BundleDto {
  String? id;
  String? name;
  int? status;
  bool? private;
  String? flowId;
  BundleDto({this.id, this.name, this.status, this.private, this.flowId});
}
