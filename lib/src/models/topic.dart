class Topic {
  int? id;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;

  Topic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
