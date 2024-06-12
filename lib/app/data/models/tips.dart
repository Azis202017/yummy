// To parse this JSON data, do
//
//     final tips = tipsFromJson(jsonString);

import 'dart:convert';

Tips tipsFromJson(String str) => Tips.fromJson(json.decode(str));

String tipsToJson(Tips data) => json.encode(data.toJson());

class Tips {
    int? id;
    int? userId;
    String? judul;
    String? cover;
    String? langkahLangkah;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? fotoUrl;

    Tips({
        this.id,
        this.userId,
        this.judul,
        this.cover,
        this.langkahLangkah,
        this.createdAt,
        this.updatedAt,
        this.fotoUrl,
    });

    factory Tips.fromJson(Map<String, dynamic> json) => Tips(
        id: json["id"],
        userId: json["user_id"],
        judul: json["judul"],
        cover: json["cover"],
        langkahLangkah: json["langkah-langkah"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        fotoUrl: json["foto_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "judul": judul,
        "cover": cover,
        "langkah-langkah": langkahLangkah,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "foto_url": fotoUrl,
    };
}
