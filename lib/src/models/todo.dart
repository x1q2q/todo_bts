import 'item.dart';

class Todo {
  final int id;
  final String name;
  final List<Item> items;
  Todo({required this.id, required this.name, required this.items});
  factory Todo.fromJson(Map<String, dynamic> json) {
    List<Item> extractItem = List.generate(json['items'].length, (j) {
      return Item.fromJson(json['items'][j]);
    });
    return Todo(id: json['id'], name: json['name'], items: extractItem);
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'items': items};
  }
}
