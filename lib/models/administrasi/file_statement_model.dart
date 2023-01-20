// To parse this JSON data, do
//
//     final fileStatement = fileStatementFromJson(jsonString);

class Statement {
  Statement({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  FileStatement? data;

  factory Statement.fromJson(Map<String, dynamic> json) => Statement(
        status: json["status"],
        message: json["message"],
        data: FileStatement.fromJson(json["data"]),
      );
}

class FileStatement {
  FileStatement({
    this.statementLink,
    this.statementParentLink,
  });

  String? statementLink;
  String? statementParentLink;

  factory FileStatement.fromJson(Map<String, dynamic> json) => FileStatement(
        statementLink: json["statement_link"],
        statementParentLink: json["statement_parent_link"],
      );
}
