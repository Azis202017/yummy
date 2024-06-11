// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    int? id;
    String? name;
    String? foto;
    String? email;
    dynamic emailVerifiedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? fotoUrl;
    List<Resep>? reseps;

    User({
        this.id,
        this.name,
        this.foto,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.fotoUrl,
        this.reseps,
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
        reseps: json["reseps"] == null ? [] : List<Resep>.from(json["reseps"]!.map((x) => Resep.fromJson(x))),
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
        "reseps": reseps == null ? [] : List<dynamic>.from(reseps!.map((x) => x.toJson())),
    };
}

class Resep {
    int? id;
    int? userId;
    String? judulResep;
    String? fotoResep;
    int? lamaMemasak;
    String? caraMemasak;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? fotoResepUrl;

    Resep({
        this.id,
        this.userId,
        this.judulResep,
        this.fotoResep,
        this.lamaMemasak,
        this.caraMemasak,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.fotoResepUrl,
    });

    factory Resep.fromJson(Map<String, dynamic> json) => Resep(
        id: json["id"],
        userId: json["user_id"],
        judulResep: json["judul_resep"],
        fotoResep: json["foto_resep"],
        lamaMemasak: json["lama_memasak"],
        caraMemasak: json["cara_memasak"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        fotoResepUrl: json["foto_resep_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "judul_resep": judulResep,
        "foto_resep": fotoResep,
        "lama_memasak": lamaMemasak,
        "cara_memasak": caraMemasak,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "foto_resep_url": fotoResepUrl,
    };
}
