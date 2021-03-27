import 'package:marvel_app/models/character.dart';

class MarvelBaseResponse {
  final int code; //	int	The HTTP status code of the returned result
  final String status; //string	A string description of the call status
  final ContainerData data; //A container	The results returned by the call
  final String etag; //string	A digest value of the content
  final String copyright; //string	The copyright notice for the returned result
  final String attributionText; //string	The attribution notice for this result
  final String
      attributionHTML; //string	An HTML representation of the attribution notice for this result

  MarvelBaseResponse(
      {this.code,
      this.status,
      this.data,
      this.etag,
      this.copyright,
      this.attributionText,
      this.attributionHTML});

  factory MarvelBaseResponse.fromJson(dynamic json) {
    return MarvelBaseResponse(
        code: json['code'],
        status: json['status'],
        copyright: json['copyright'],
        attributionText: json['attributionText'],
        attributionHTML: json['attributionHTML'],
        data:
            json['data'] != null ? ContainerData.fromJson(json['data']) : null,
        etag: json['etag']);
  }
}

class ContainerData {
  final int offset; //	int	The requested offset (skipped results) of the call
  final int limit; //	int	The requested result limit
  final int total; //	int	The total number of results available
  final int count; //int	The total number of results returned by this call
  final List<Character>
      results; //Array[entity type]	The list of entities returned by the call

  ContainerData(
      {this.offset, this.limit, this.total, this.count, this.results});

  factory ContainerData.fromJson(dynamic json) {
    return ContainerData(
        offset: json['offset'],
        limit: json['limit'],
        total: json['total'],
        count: json['count'],
        results: json['results'] != null
            ? (json['results'] as List)
                .map((i) => Character.fromJson(i))
                .toList()
            : null);
  }
}
