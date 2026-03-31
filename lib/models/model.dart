typedef JsonObject = Map<String, dynamic>;
typedef JsonArray = List<JsonObject>;

class Model {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  const Model({this.id, this.createdAt, this.updatedAt, this.deletedAt});

  Model.fromJson(JsonObject json)
    : id = json['id'],
      createdAt = json['created_at'],
      updatedAt = json['updated_at'],
      deletedAt = json['deleted_at'];
}
