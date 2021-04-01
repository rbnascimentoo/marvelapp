import 'package:marvelapp/models/character_response.dart';

class Stories {
  final int id;
  final String title;
  final String description;
  final Thumbnail thumbnail;

  Stories({this.id, this.title, this.description, this.thumbnail});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Stories &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title;

  @override
  int get hashCode => id.hashCode ^ title.hashCode;

  factory Stories.fromJson(dynamic json) {
    return Stories(
        id: json["id"],
        title: json['title'],
        description: json['description'],
        thumbnail: json['thumbnail'] != null
            ? Thumbnail.fromJson(json['thumbnail'])
            : null
    );
  }


}
