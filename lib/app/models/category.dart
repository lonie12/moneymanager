class Category {
  Category({
    required this.id,
    required this.color,
    required this.name,
    required this.type,
    required this.currency,
    required this.description,
  });

  int id;
  String color;
  String name;
  String type;
  String currency;
  String description;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      color: json["color"],
      name: json["name"],
      type: json["type"],
      currency: json["currency"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "color": color,
        "name": name,
        "type": type,
        "currency": currency,
        "description": description,
      };
}
