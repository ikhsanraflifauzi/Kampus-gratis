class ResponResultAssignment {
  ResponResultAssignment({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  AssignmentDetailModel? data;

  factory ResponResultAssignment.fromJson(Map<String, dynamic> json) =>
      ResponResultAssignment(
        status: json["status"],
        message: json["message"],
        data: AssignmentDetailModel.fromJson(json["data"]),
      );
}

class AssignmentDetailModel {
  AssignmentDetailModel({
    this.assignment,
    this.studentsWork,
  });

  Assignment? assignment;
  StudentsWork? studentsWork;

  factory AssignmentDetailModel.fromJson(Map<String, dynamic>? json) =>
      AssignmentDetailModel(
        assignment: Assignment.fromJson(json?["assignment"]),
        studentsWork: StudentsWork.fromJson(json?["students_work"]),
      );
}

class Assignment {
  Assignment({
    this.createdAt,
    this.id,
    this.sessionId,
    this.duration,
    this.content,
    this.description,
    this.fileAssignment,
    this.fileAssignmentLink,
    this.createdBy,
    this.lecturer,
    this.deadline,
  });

  DateTime? createdAt;
  String? id;
  String? sessionId;
  int? duration;
  String? content;
  String? description;
  String? fileAssignment;
  String? fileAssignmentLink;
  String? createdBy;
  Lecturer? lecturer;
  String? deadline;

  factory Assignment.fromJson(Map<String, dynamic>? json) => Assignment(
        createdAt: DateTime.parse(json?["created_at"]),
        id: json?["id"],
        sessionId: json?["session_id"],
        duration: json?["duration"],
        content: json?["content"],
        description: json?["description"],
        fileAssignment: json?["file_assignment"],
        fileAssignmentLink: json?["file_assignment_link"],
        createdBy: json?["created_by"],
        lecturer: Lecturer.fromJson(json?["Lecturer"]),
        deadline: json?["deadline"],
      );
}

class Lecturer {
  Lecturer({
    this.userId,
    this.title,
    this.user,
  });

  String? userId;
  dynamic title;
  User? user;

  factory Lecturer.fromJson(Map<String, dynamic> json) => Lecturer(
        userId: json["user_id"],
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

class StudentsWork {
  StudentsWork({
    this.id,
    this.studentId,
    this.sessionId,
    this.materialId,
    this.subjectId,
    this.description,
    this.status,
    this.idReferrer,
    this.type,
    this.score,
    this.activityDetail,
    this.createdAt,
  });

  String? id;
  String? studentId;
  String? sessionId;
  String? materialId;
  String? subjectId;
  String? description;
  String? status;
  String? idReferrer;
  String? type;
  double? score;
  ActivityDetail? activityDetail;
  DateTime? createdAt;

  factory StudentsWork.fromJson(Map<String, dynamic>? json) => StudentsWork(
        id: json?["id"],
        studentId: json?["student_id"],
        sessionId: json?["session_id"],
        materialId: json?["material_id"],
        subjectId: json?["subject_id"],
        description: json?["description"],
        status: json?["status"],
        idReferrer: json?["id_referrer"],
        type: json?["type"],
        score: json?["score"],
        activityDetail: ActivityDetail.fromJson(json?["activity_detail"]),
        createdAt: DateTime.parse(json?["created_at"]),
      );
}

class ActivityDetail {
  ActivityDetail({
    this.dateSubmit,
    this.fileAssignment,
    this.fileAssignmentLink,
  });

  String? dateSubmit;
  String? fileAssignment;
  String? fileAssignmentLink;

  factory ActivityDetail.fromJson(Map<String, dynamic>? json) => ActivityDetail(
        dateSubmit: json?["date_submit"],
        fileAssignment: json?["file_assignment"],
        fileAssignmentLink: json?["file_assignment_link"],
      );
}


// class ResponResultAssignment {
//   AssignmentDetail({
//     requiredrequired this.status,
//      this.message,
//     required this.data,
//   });

//   bool status;
//   String message;
//   List<AssignmentDetailModel?> data;

//   factory AssignmentDetail.fromJson(Map<String, dynamic> json) =>
//       AssignmentDetail(
//         status: json["status"],
//         message: json["message"],
//         data: List<AssignmentDetailModel?>.from(
//             json["data"].map((x) => AssignmentDetailModel.fromJson(x))),
//       );
// }

// class AssignmentDetailModel {
//   AssignmentDetailModel({
//     required this.assignment,
//     required this.startDate,
//     required this.duration,
//     required this.deadline,
//   });

//   Assignment assignment;
//   DateTime startDate;
//   int duration;
//   DateTime deadline;

//   factory AssignmentDetailModel.fromJson(Map<String, dynamic> json) =>
//       AssignmentDetailModel(
//         assignment: Assignment.fromJson(json["assignment"]),
//         startDate: DateTime.parse(json["start_date"]),
//         duration: json["duration"],
//         deadline: DateTime.parse(json["deadline"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "assignment": assignment.toJson(),
//         "start_date": startDate.toIso8601String(),
//         "duration": duration,
//         "deadline": deadline.toIso8601String(),
//       };
// }

// class Assignment {
//   Assignment({
//     required this.id,
//     required this.sessionId,
//     required this.duration,
//     required this.description,
//     required this.content,
//     required this.fileAssignment,
//     required this.fileAssignmentLink,
//     required this.createdBy,
//     required this.lecturer,
//   });

//   String id;
//   String sessionId;
//   int duration;
//   String description;
//   String content;
//   String fileAssignment;
//   String fileAssignmentLink;
//   String createdBy;
//   Lecturer lecturer;

//   factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
//         id: json["id"],
//         sessionId: json["session_id"],
//         duration: json["duration"],
//         description: json["description"],
//         content: json["content"],
//         fileAssignment: json["file_assignment"],
//         fileAssignmentLink: json["file_assignment_link"],
//         createdBy: json["created_by"],
//         lecturer: Lecturer.fromJson(json["Lecturer"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "session_id": sessionId,
//         "duration": duration,
//         "description": description,
//         "content": content,
//         "file_assignment": fileAssignment,
//         "file_assignment_link": fileAssignmentLink,
//         "created_by": createdBy,
//         "Lecturer": lecturer.toJson(),
//       };
// }

// class Lecturer {
//   Lecturer({
//     required this.userId,
//     required this.title,
//     required this.user,
//   });

//   String userId;
//   List<String> title;
//   User user;

//   factory Lecturer.fromJson(Map<String, dynamic> json) => Lecturer(
//         userId: json["user_id"],
//         title: List<String>.from(json["title"].map((x) => x)),
//         user: User.fromJson(json["User"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "user_id": userId,
//         "title": List<dynamic>.from(title.map((x) => x)),
//         "User": user.toJson(),
//       };
// }

// class User {
//   User({
//     required this.fullName,
//   });

//   String fullName;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         fullName: json["full_name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "full_name": fullName,
//       };
// }

// class AssignmentDetail {
//   AssignmentDetail({
//     this.status,
//     this.message,
//     this.data,
//   });

//   final bool? status;
//   final String? message;
//   final AssignmentDetailModel? data;

//   factory AssignmentDetail.fromJson(Map<String?, dynamic> json) =>
//       AssignmentDetail(
//         status: json["status"],
//         message: json["message"],
//         data: AssignmentDetailModel.fromJson(json["data"]),
//       );

//   // Map<String?, dynamic> toJson() => {
//   //       "status": status,
//   //       "message": message,
//   //       "data": data.toJson(),
//   //     };
// }

// class AssignmentDetailModel {
//   AssignmentDetailModel({
//     this.assignment,
//     this.studentsWork,
//   });

//   final AssignmentClass? assignment;
//   final StudentsWork? studentsWork;

//   factory AssignmentDetailModel.fromJson(Map<String?, dynamic>? json) =>
//       AssignmentDetailModel(
//         assignment: AssignmentClass.fromJson(json?["assignment"]),
//         studentsWork: StudentsWork.fromJson(json?["students_work"]),
//       );

//   // Map<String?, dynamic> toJson() => {
//   //       "assignment": assignment.toJson(),
//   //       "students_work": studentsWork.toJson(),
//   //     };
// }

// class AssignmentClass {
//   AssignmentClass(
//       {this.id,
//       this.content,
//       this.description,
//       this.fileAssignment,
//       this.fileAssignmentLink,
//       this.duration,
//       //  this.createdAt,
//       this.deadline});

//   final String? id;
//   final String? content;
//   final String? description;
//   final String? fileAssignment;
//   final String? fileAssignmentLink;
//   final int? duration;
//   // final String? createdAt;
//   final String? deadline;

//   factory AssignmentClass.fromJson(Map<String?, dynamic> json) =>
//       AssignmentClass(
//         id: json["id"],
//         content: json["content"],
//         description: json["description"],
//         fileAssignment: json["file_assignment"],
//         fileAssignmentLink: json["file_assignment_link"],
//         duration: json["duration"],
//         // createdAt: json["created_at"],
//         deadline: json["deadline"],
//       );

//   // Map<String?, dynamic> toJson() => {
//   //       "id": id,
//   //       "content": content,
//   //       "description": description,
//   //       "file_assignment": fileAssignment,
//   //       "file_assignment_link": fileAssignmentLink,
//   //       "duration": duration,
//   //       "deadline": deadline,
//   //     };
// }

// class StudentsWork {
//   StudentsWork({
//     this.id,
//     this.studentId,
//     this.sessionId,
//     this.materialId,
//     this.subjectId,
//     this.description,
//     this.status,
//     this.idReferrer,
//     this.type,
//     this.score,
//     this.activityDetail,
//   });

//   final String? id;
//   final String? studentId;
//   final String? sessionId;
//   final dynamic materialId;
//   final dynamic subjectId;
//   final String? description;
//   final String? status;
//   final String? idReferrer;
//   final String? type;
//   final dynamic score;
//   final ActivityDetail? activityDetail;

//   factory StudentsWork.fromJson(Map<String?, dynamic> json) => StudentsWork(
//         id: json["id"],
//         studentId: json["student_id"],
//         sessionId: json["session_id"],
//         materialId: json["material_id"],
//         subjectId: json["subject_id"],
//         description: json["description"],
//         status: json["status"],
//         idReferrer: json["id_referrer"],
//         type: json["type"],
//         score: json["score"],
//         activityDetail: ActivityDetail?.fromJson(json["activity_detail"]),
//       );

//   // Map<String?, dynamic> toJson() => {
//   //       "id": id,
//   //       "student_id": studentId,
//   //       "session_id": sessionId,
//   //       "material_id": materialId,
//   //       "subject_id": subjectId,
//   //       "description": description,
//   //       "status": status,
//   //       "id_referrer": idReferrer,
//   //       "type": type,
//   //       "score": score,
//   //       "activity_detail": activityDetail?.toJson(),
//   //     };
// }

// class ActivityDetail {
//   ActivityDetail({
//     this.dateSubmit,
//     this.fileAssignment,
//     this.fileAssignmentLink,
//   });

//   final String? dateSubmit;
//   final String? fileAssignment;
//   final String? fileAssignmentLink;

//   factory ActivityDetail.fromJson(Map<String?, dynamic>? json) =>
//       ActivityDetail(
//         dateSubmit: json?["date_submit"],
//         fileAssignment: json?["file_assignment"],
//         fileAssignmentLink: json?["file_assignment_link"],
//       );

//   // Map<String?, dynamic> toJson() => {
//   //       "date_submit": dateSubmit,
//   //       "file_assignment": fileAssignment,
//   //       "file_assignment_link": fileAssignmentLink,
//   //     };
// }
