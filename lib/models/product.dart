class Product {
  int id;
  String name;
  String description;
  final int category;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.category});

  Map toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'category': category,
      };

  Map<String, dynamic> toJsonn() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['category'] = this.category;
    return data;
  }
}
