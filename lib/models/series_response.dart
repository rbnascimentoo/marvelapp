import 'package:marvelapp/models/character_response.dart';

class Series {
  final int id;
  final String title;
  final String description;
  final Thumbnail thumbnail;

  Series({this.id, this.title, this.description, this.thumbnail});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Series &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title;

  @override
  int get hashCode => id.hashCode ^ title.hashCode;

  factory Series.fromJson(dynamic json) {
    return Series(
        id: json["id"],
        title: json['title'],
        description: json['description'],
        thumbnail: json['thumbnail'] != null
            ? Thumbnail.fromJson(json['thumbnail'])
            : null
    );
  }


}
