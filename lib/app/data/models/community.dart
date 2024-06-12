import 'dart:convert';

Community communityFromJson(String str) => Community.fromJson(json.decode(str));

String communityToJson(Community data) => json.encode(data.toJson());

class Community {
  int? id;
  int? userId;
  String? title;
  String? description;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fotoUrl;
  User? user;
  List<Commentar>? commentar;

  Community({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.fotoUrl,
    this.user,
    this.commentar,
  });

  factory Community.fromJson(Map<String, dynamic> json) => Community(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        fotoUrl: json["foto_url"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        commentar: json["commentar"] == null
            ? []
            : List<Commentar>.from(
                json["commentar"].map((x) => Commentar.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "description": description,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "foto_url": fotoUrl,
        "user": user?.toJson(),
        "commentar": commentar == null
            ? []
            : List<dynamic>.from(commentar?.map((x) => x.toJson()) ?? []),
      };
}

class Commentar {
  int? id;
  int? userId;
  int? communityId;
  Title? title;
  DateTime? createdAt;
  DateTime? updatedAt;

  Commentar({
    this.id,
    this.userId,
    this.communityId,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  factory Commentar.fromJson(Map<String, dynamic> json) => Commentar(
        id: json["id"],
        userId: json["user_id"],
        communityId: json["community_id"],
        title: json["title"] == null ? null : titleValues.map[json["title"]],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "community_id": communityId,
        "title": title == null ? null : titleValues.reverse[title],
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

enum Title { HALO, HALOO, HALOQ }

final titleValues = EnumValues(
    {"halo": Title.HALO, "haloo": Title.HALOO, "haloq": Title.HALOQ});

class User {
  int? id;
  String? name;
  String? foto;
  String? email;
  dynamic emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fotoUrl;

  User({
    this.id,
    this.name,
    this.foto,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.fotoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        foto: json["foto"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        fotoUrl: json["foto_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "foto": foto,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "foto_url": fotoUrl,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
