class FakultasModel {
  FakultasModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  dynamic data;

  factory FakultasModel.fromJson(Map<String, dynamic> json) => FakultasModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.thumbnailLink,
    this.majorCount,
    this.subjectCount,
    this.sksCount,
  });

  String? id;
  String? name;
  String? thumbnailLink;
  String? majorCount;
  String? subjectCount;
  String? sksCount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        thumbnailLink: json["thumbnail_link"],
        majorCount: json["major_count"],
        subjectCount: json["subject_count"],
        sksCount: json["sks_count"],
      );
}
