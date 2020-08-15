class Subjects {
  String subject, subjectID;
  Subjects({this.subject, this.subjectID});
  factory Subjects.fromJson(Map<String, dynamic> json) {
    return Subjects(
      subject: json['subjectName'] as String,
      subjectID: json['subjectId'] as String,
    );
  }
}
