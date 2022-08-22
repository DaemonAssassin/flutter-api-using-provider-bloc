// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Posts {
  int id;
  int userId;
  String title;
  String body;
  Posts({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  Posts copyWith({
    int? id,
    int? userId,
    String? title,
    String? body,
  }) {
    return Posts(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
    };
  }

  factory Posts.fromMap(Map<String, dynamic> map) {
    return Posts(
      id: map['id'] as int,
      userId: map['userId'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Posts.fromJson(String source) =>
      Posts.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Posts(id: $id, userId: $userId, title: $title, body: $body)';
  }

  @override
  bool operator ==(covariant Posts other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode {
    return id.hashCode ^ userId.hashCode ^ title.hashCode ^ body.hashCode;
  }
}
