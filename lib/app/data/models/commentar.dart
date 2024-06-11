// To parse this JSON data, do
//
//     final commentar = commentarFromJson(jsonString);

import 'dart:convert';

Commentar commentarFromJson(String str) => Commentar.fromJson(json.decode(str));

String commentarToJson(Commentar data) => json.encode(data.toJson());

class Commentar {
    String? id;
    int? userId;
    int? communityId;
    String? title;
    DateTime? createdAt;
    DateTime? updatedAt;
    Community? community;
    User? user;

    Commentar({
        this.id,
        this.userId,
        this.communityId,
        this.title,
        this.createdAt,
        this.updatedAt,
        this.community,
        this.user,
    });

    factory Commentar.fromJson(Map<String, dynamic> json) => Commentar(
        id: json["id"],
        userId: json["user_id"],
        communityId: json["community_id"],
        title: json["title"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        community: json["community"] == null ? null : Community.fromJson(json["community"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "community_id": communityId,
        "title": title,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "community": community?.toJson(),
        "user": user?.toJson(),
    };
}

class Community {
    String? id;
    int? userId;
    String? title;
    String? description;
    String? image;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? fotoUrl;

    Community({
        this.id,
        this.userId,
        this.title,
        this.description,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.fotoUrl,
    });

    factory Community.fromJson(Map<String, dynamic> json) => Community(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        fotoUrl: json["foto_url"],
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
    };
}

class User {
    String? id;
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
