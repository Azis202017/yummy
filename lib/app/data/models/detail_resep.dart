
import 'dart:convert';

DetailResep detailResepFromJson(String str) => DetailResep.fromJson(json.decode(str));

String detailResepToJson(DetailResep data) => json.encode(data.toJson());

class DetailResep {
    int? id;
    int? userId;
    String? judulResep;
    String? fotoResep;
    int? lamaMemasak;
    String? caraMemasak;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? fotoUrl;

    DetailResep({
        this.id,
        this.userId,
        this.judulResep,
        this.fotoResep,
        this.lamaMemasak,
        this.caraMemasak,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.fotoUrl,
    });

    factory DetailResep.fromJson(Map<String, dynamic> json) => DetailResep(
        id: json["id"],
        userId: json["user_id"],
        judulResep: json["judul_resep"],
        fotoResep: json["foto_resep"],
        lamaMemasak: json["lama_memasak"],
        caraMemasak: json["cara_memasak"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        fotoUrl: json["foto_url"],
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
        "foto_url": fotoUrl,
    };
}
