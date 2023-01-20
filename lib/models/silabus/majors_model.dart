class MajorsModel {
  MajorsModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  dynamic data;

  factory MajorsModel.fromJson(Map<String, dynamic> json) => MajorsModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.id,
    this.name,
    this.thumbnailLink,
    this.majors,
  });

  String? id;
  String? name;
  String? thumbnailLink;
  List<Majors>? majors;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        thumbnailLink: json["thumbnail_link"],
        majors:
            List<Majors>.from(json["Majors"].map((x) => Majors.fromJson(x))),
      );
}

class Majors {
  Majors({
    this.creditTotal,
    this.id,
    this.name,
    this.headOfMajor,
    this.thumbnailLink,
    this.description,
    this.faculty,
    this.lecturer,
  });

  String? id;
  String? creditTotal;
  String? name;
  String? headOfMajor;
  String? thumbnailLink;
  String? description;
  String? faculty;
  Lecturer? lecturer;

  factory Majors.fromJson(Map<String, dynamic> json) => Majors(
        creditTotal: json["credit_total"],
        id: json["id"],
        name: json["name"],
        headOfMajor: json["head_of_major"],
        thumbnailLink: json["thumbnail_link"],
        description: json["description"],
        faculty: json["faculty"],
        lecturer: Lecturer.fromJson(json["Lecturer"]),
      );
}

class Lecturer {
  Lecturer({
    this.title,
    this.user,
  });

  List<String>? title;
  User? user;

  factory Lecturer.fromJson(Map<String, dynamic> json) => Lecturer(
        title: List<String>.from(json["title"].map((x) => x)),
        user: User.fromJson(json["User"]),
      );
}

class User {
  User({
    this.fullName,
  });

  String? fullName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["full_name"],
      );
}
