class Character {
  final int id;
  final String name;
  final String description;
  final String modified;
  final String resourceURI;
  final List<Urls> urls;
  final Thumbnail thumbnail;
  final Comics comics;

  // final Stories stories;
  // final Events events;
  // final Series series;

  Character(
      {this.id,
      this.name,
      this.description,
      this.modified,
      this.resourceURI,
      this.urls,
      this.thumbnail,
      this.comics
      // this.stories,
      // this.events,
      // this.series,
      });

  factory Character.fromJson(dynamic json) {
    return Character(
        id: json["id"],
        name: json['name'],
        description: json['description'],
        modified: json['modified'],
        resourceURI: json['resourceURI'],
        thumbnail: json['thumbnail'] != null
            ? Thumbnail.fromJson(json['thumbnail'])
            : null,
        comics: json['comics'] != null ? Comics.fromJson(json['comics']) : null,
        urls: json['urls'] != null
            ? (json['urls'] as List).map((i) => Urls.fromJson(i)).toList()
            : null);
  }
}

class Urls {
  final String type;
  final String url;

  Urls({this.type, this.url});

  factory Urls.fromJson(dynamic json) {
    return Urls(type: json['type'], url: json['url']);
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

class Comics {
  final int available;
  final int returned;
  final String collectionURI;
  final List<Items> items;

  Comics({this.available, this.returned, this.collectionURI, this.items});

  factory Comics.fromJson(dynamic json) {
    return Comics(
        available: json['available'],
        returned: json['returned'],
        collectionURI: json['collectionURI'],
        items: json['items'] != null
            ? (json['items'] as List).map((i) => Items.fromJson(i)).toList()
            : null);
  }
}

class Items {
  final String resourceURI;
  final String name;

  Items({this.resourceURI, this.name});

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(resourceURI: json['resourceURI'], name: json['name']);
  }
}

// class Items {
//   String resourceURI;
//   String name;
//   String type;
//
//   Items({this.resourceURI, this.name, this.type});
//
//   Items.fromJson(Map<String, dynamic> json) {
//     resourceURI = json['resourceURI'];
//     name = json['name'];
//     type = json['type'];
//   }
//
// }
