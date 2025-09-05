class Model {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  const Model({this.id, this.createdAt, this.updatedAt, this.deletedAt});

  Model.fromJson(Map<String, dynamic> data)
    : id = data['id'],
      createdAt = data['created_at'],
      updatedAt = data['updated_at'],
      deletedAt = data['deleted_at'];
}
