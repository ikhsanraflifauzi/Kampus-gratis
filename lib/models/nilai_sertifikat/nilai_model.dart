class Nilai {
  Nilai({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  NilaiModel? data;

  factory Nilai.fromJson(Map<String, dynamic> json) => Nilai(
        success: json["success"],
        message: json["message"],
        data: NilaiModel.fromJson(json["data"]),
      );
}

class NilaiModel {
  NilaiModel({
    this.studentInformation,
    this.report,
  });

  StudentInformation? studentInformation;
  List<Report>? report;

  factory NilaiModel.fromJson(Map<String, dynamic> json) => NilaiModel(
        studentInformation:
            StudentInformation.fromJson(json["student_information"]),
        report:
            List<Report>.from(json["report"].map((x) => Report.fromJson(x))),
      );
}

class Report {
  Report({
    this.semester,
    this.analyticsId,
    this.gpa,
    this.subjectData,
  });

  int? semester;
  String? analyticsId;
  double? gpa;
  List<SubjectReport>? subjectData;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        semester: json["semester"],
        analyticsId: json["analytics_id"] == null ? null : json["analytics_id"],
        gpa: json["gpa"].toDouble(),
        subjectData: List<SubjectReport>.from(
            json["subject_data"].map((x) => SubjectReport.fromJson(x))),
      );
}

class SubjectReport {
  SubjectReport({
    this.id,
    this.subjectId,
    this.dateTaken,
    this.dateFinished,
    this.status,
    this.finalScore,
    this.semester,
  });

  String? id;
  String? subjectId;
  DateTime? dateTaken;
  DateTime? dateFinished;
  String? status;
  double? finalScore;
  int? semester;

  factory SubjectReport.fromJson(Map<String, dynamic> json) => SubjectReport(
        id: json["id"],
        subjectId: json["subject_id"],
        dateTaken: json["date_taken"] == null
            ? null
            : DateTime.parse(json["date_taken"]),
        dateFinished: json["date_finished"] == null
            ? null
            : DateTime.parse(json["date_finished"]),
        status: json["status"],
        finalScore: json["final_score"].toDouble(),
        semester: json["semester"],
      );
}

class StudentInformation {
  StudentInformation({
    this.studentName,
    this.nsn,
    this.major,
    this.semester,
    this.creditFinished,
    this.subjectsFinished,
    this.gpa,
  });

  String? studentName;
  String? nsn;
  String? major;
  int? semester;
  int? creditFinished;
  int? subjectsFinished;
  double? gpa;

  factory StudentInformation.fromJson(Map<String, dynamic> json) =>
      StudentInformation(
        studentName: json["student_name"],
        nsn: json["nsn"],
        major: json["major"],
        semester: json["semester"],
        creditFinished: json["credit_finished"],
        subjectsFinished: json["subjects_finished"],
        gpa: json["gpa"].toDouble(),
      );
}
