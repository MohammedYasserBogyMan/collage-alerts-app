class AlertModel {
  final String title;
  final String description;
  final DateTime dateTime;
  final String createFrom;

  AlertModel({
    required this.createFrom,
    required this.title,
    required this.description,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'dateTime': dateTime.toIso8601String(),
      'createFrom': createFrom,
    };
  }

  factory AlertModel.fromMap(Map<String, dynamic> map) {
    return AlertModel(
      createFrom: map['createdBy'],
      title: map['title'],
      description: map['description'],
      dateTime: DateTime.parse(map['dateTime']),
    );
  }
}
