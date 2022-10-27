class ModelMeta {
  int? currentPage;
  int? lastPage;
  int? perPage;
  int? total;

  ModelMeta({this.currentPage, this.lastPage, this.perPage, this.total});

  ModelMeta.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    lastPage = json['lastPage'];
    perPage = json['perPage'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['lastPage'] = lastPage;
    data['perPage'] = perPage;
    data['total'] = total;
    return data;
  }
}
