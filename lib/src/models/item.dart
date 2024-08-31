class Item {
  final int id;
  final String name;
  final bool itemCompletionStatus;
  Item(
      {required this.id,
      required this.name,
      required this.itemCompletionStatus});
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: int.parse(json['id']),
      name: json['name'],
      itemCompletionStatus: json['itemCompletionStatus'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'itemCompletionStatus': itemCompletionStatus
    };
  }
}
