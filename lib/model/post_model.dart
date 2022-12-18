
import 'dart:convert';

class PostModel {
  final String id;
  final String username;
  final String date;
  final String postText;
  PostModel({
    required this.id,
    required this.username,
    required this.date,
    required this.postText,
  });

  PostModel copyWith({
    String? id,
    String? username,
    String? date,
    String? postText,
  }) {
    return PostModel(
      id: id ?? this.id,
      username: username ?? this.username,
      date: date ?? this.date,
      postText: postText ?? this.postText,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'date': date,
      'postText': postText,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] as String,
      username: map['username'] as String,
      date: map['date'] as String,
      postText: map['postText'] as String,
    );
  }

  

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  
  
 
}
