class TodoItem {
  String key;
  String content;
  DateTime date;
  bool isChecked;

  TodoItem(this.key, this.content, this.date, this.isChecked);

  factory TodoItem.fromJson(Map<String, dynamic> json) => TodoItem(json["key"],
      json["content"], DateTime.parse(json["date"]), json["isChecked"]);

  Map<String, dynamic> toJson() => {
        "key": key,
        "content": content,
        "date": date.toIso8601String(),
        "isChecked": isChecked,
      };
}
