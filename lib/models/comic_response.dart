import 'package:marvelapp/models/character_response.dart';

class Comics {
  final String id;
  final String title;
  final String description;
  final Thumbnail thumbnail;

  Comics({this.id, this.title, this.description, this.thumbnail});

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
