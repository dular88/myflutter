// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatalogModel {
  static List<Item> items = [];
}

class Item {
  final int albumId;
  final int id;
  final String title;
  final String thumbnailUrl;

  Item(
      {this.albumId = 1, this.id = 1, this.title = '', this.thumbnailUrl = ''});

  Item copyWith({
    int albumId = 1,
    int id = 1,
    String title = '',
    String thumbnailUrl = '',
  }) {
    return Item(
      albumId: albumId,
      id: id,
      title: title,
      thumbnailUrl: thumbnailUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'albumId': albumId,
      'id': id,
      'title': title,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      albumId: map['albumId'],
      id: map['id'],
      title: map['title'],
      thumbnailUrl: map['thumbnailUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(albumId: $albumId, id: $id, title: $title, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.albumId == albumId &&
        other.id == id &&
        other.title == title &&
        other.thumbnailUrl == thumbnailUrl;
  }

  @override
  int get hashCode {
    return albumId.hashCode ^
        id.hashCode ^
        title.hashCode ^
        thumbnailUrl.hashCode;
  }
}
