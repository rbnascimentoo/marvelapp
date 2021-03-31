import 'package:marvelapp/models/character_response.dart';
import 'package:marvelapp/models/comic_response.dart';
import 'package:marvelapp/models/series_response.dart';
import 'package:marvelapp/models/stories_response.dart';

class MarvelBaseResponse {
  int code; //	int	The HTTP status code of the returned result
  String status; //string	A string description of the call status
  ContainerData data; //A container	The results returned by the call
  String etag; //string	A digest value of the content
  String copyright; //string	The copyright notice for the returned result
  String attributionText; //string	The attribution notice for this result
  String attributionHTML; //string	An HTML representation of the attribution notice for this result

  MarvelBaseResponse(
      {this.code,
      this.status,
      this.data,
      this.etag,
      this.copyright,
      this.attributionText,
      this.attributionHTML});

  factory MarvelBaseResponse.fromJsonToCharacter(dynamic json) {
    return MarvelBaseResponse(
        code: json['code'],
        status: json['status'],
        copyright: json['copyright'],
        attributionText: json['attributionText'],
        attributionHTML: json['attributionHTML'],
        data: json['data'] != null
            ? ContainerData.fromJsonToCharacter(json['data'])
            : null,
        etag: json['etag']);
  }

  factory MarvelBaseResponse.fromJsonToComics(dynamic json) {
    return MarvelBaseResponse(
        code: json['code'],
        status: json['status'],
        copyright: json['copyright'],
        attributionText: json['attributionText'],
        attributionHTML: json['attributionHTML'],
        data: json['data'] != null
            ? ContainerData.fromJsonToComics(json['data'])
            : null,
        etag: json['etag']);
  }

  factory MarvelBaseResponse.fromJsonToSeries(dynamic json) {
    return MarvelBaseResponse(
        code: json['code'],
        status: json['status'],
        copyright: json['copyright'],
        attributionText: json['attributionText'],
        attributionHTML: json['attributionHTML'],
        data: json['data'] != null
            ? ContainerData.fromJsonToSeries(json['data'])
            : null,
        etag: json['etag']);
  }

  factory MarvelBaseResponse.fromJsonToStories(dynamic json) {
    return MarvelBaseResponse(
        code: json['code'],
        status: json['status'],
        copyright: json['copyright'],
        attributionText: json['attributionText'],
        attributionHTML: json['attributionHTML'],
        data: json['data'] != null
            ? ContainerData.fromJsonToStories(json['data'])
            : null,
        etag: json['etag']);
  }
}

class ContainerData {
  final int offset; //	int	The requested offset (skipped results) of the call
  final int limit; //	int	The requested result limit
  final int total; //	int	The total number of results available
  final int count; //int	The total number of results returned by this call
  final List
      results; //Array[entity type]	The list of entities returned by the call

  ContainerData(
      {this.offset, this.limit, this.total, this.count, this.results});

  factory ContainerData.fromJsonToCharacter(dynamic json) {
    return ContainerData(
        offset: json['offset'],
        limit: json['limit'],
        total: json['total'],
        count: json['count'],
        results: json['results'] != null
            ? (json['results'] as List).map((i) => Character.fromJson(i)).toList()
            : null);
  }

  factory ContainerData.fromJsonToComics(dynamic json) {
    return ContainerData(
        offset: json['offset'],
        limit: json['limit'],
        total: json['total'],
        count: json['count'],
        results: json['results'] != null
            ? (json['results'] as List).map((i) => Comics.fromJson(i)).toList()
            : null);
  }

  factory ContainerData.fromJsonToSeries(dynamic json) {
    return ContainerData(
        offset: json['offset'],
        limit: json['limit'],
        total: json['total'],
        count: json['count'],
        results: json['results'] != null
            ? (json['results'] as List).map((i) => Series.fromJson(i)).toList()
            : null);
  }

  factory ContainerData.fromJsonToStories(dynamic json) {
    return ContainerData(
        offset: json['offset'],
        limit: json['limit'],
        total: json['total'],
        count: json['count'],
        results: json['results'] != null
            ? (json['results'] as List).map((i) => Stories.fromJson(i)).toList()
            : null);
  }

}
