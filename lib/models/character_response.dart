class Character {
  final int id;
  final String name;
  final String description;
  final Thumbnail thumbnail;


  Character(
      {this.id,
      this.name,
      this.description,
      this.thumbnail
      });

  factory Character.fromJson(dynamic json) {
    return Character(
        id: json["id"],
        name: json['name'],
        description: json['description'],
        thumbnail: json['thumbnail'] != null
            ? Thumbnail.fromJson(json['thumbnail'])
            : null
    );
  }
}

class Thumbnail {
  final String path;
  final String extension;

  Thumbnail({this.path, this.extension});

  factory Thumbnail.fromJson(dynamic json) {
    return Thumbnail(path: json['path'], extension: json['extension']);
  }
}

