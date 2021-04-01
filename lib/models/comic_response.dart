import 'package:marvelapp/models/character_response.dart';

class Comics {
  final int id;
  final String title;
  final String description;
  final Thumbnail thumbnail;

  Comics({this.id, this.title, this.description, this.thumbnail});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Comics &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title;

  @override
  int get hashCode => id.hashCode ^ title.hashCode;

  factory Comics.fromJson(dynamic json) {
    return Comics(
        id: json["id"],
        title: json['title'],
        description: json['description'],
        thumbnail: json['thumbnail'] != null
            ? Thumbnail.fromJson(json['thumbnail'])
            : null
    );
  }


}
