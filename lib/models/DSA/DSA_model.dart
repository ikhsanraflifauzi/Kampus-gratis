class Dsa {
  Dsa({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<DsaModel>? data;

  factory Dsa.fromJson(Map<String, dynamic>? json) => Dsa(
        status: json?["status"],
        message: json?["message"],
        data: json?["data"] != null
            ? List<DsaModel>.from(
                json?["data"].map((x) => DsaModel.fromJson(x)))
            : [],
      );
}

class DsaModel {
  DsaModel({
    required this.id,
    required this.meetingType,
    required this.time,
    required this.place,
    required this.topic,
    required this.description,
    required this.studentId,
    required this.assessorId,
    required this.status,
    this.pickTime,
    this.score,
    this.scoreDescription,
  });

  String id;
  String meetingType;
  List<DateTime> time;
  String place;
  String topic;
  String description;
  String studentId;
  String assessorId;
  bool status;
  dynamic pickTime;
  dynamic score;
  dynamic scoreDescription;

  factory DsaModel.fromJson(Map<String, dynamic> json) => DsaModel(
        id: json["id"],
        meetingType: json["meeting_type"],
        time: List<DateTime>.from(json["time"].map((x) => DateTime.parse(x))),
        place: json["place"],
        topic: json["topic"],
        description: json["description"],
        studentId: json["student_id"],
        assessorId: json["assessor_id"],
        status: json["status"],
        pickTime: json["pick_time"],
        score: json["score"],
        scoreDescription: json["score_description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "meeting_type": meetingType,
        "time": List<dynamic>.from(time.map((x) => x.toIso8601String())),
        "place": place,
        "topic": topic,
        "description": description,
        "student_id": studentId,
        "assessor_id": assessorId,
        "status": status,
        "pick_time": pickTime,
        "score": score,
        "score_description": scoreDescription,
      };
}
