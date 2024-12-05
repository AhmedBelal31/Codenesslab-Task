import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final int? id;
  final String title;
  final String body;

  const PostModel({
    this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  @override
  List<Object?> get props => [id, title, body];
}
