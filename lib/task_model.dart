class Task {
  final String objectId;
  final String title;
  final String description;
  late final bool isCompleted;
  Task({
    required this.objectId,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      objectId: json['objectId'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['isCompleted'],
    );
  }
}
