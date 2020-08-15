class Exams {
  String courseId, subjectID, date, type;
  Exams({this.courseId, this.subjectID, this.date, this.type});
  factory Exams.fromJson(Map<String, dynamic> json) {
    return Exams(
      date: json['date'] as String,
      subjectID: json['subjectId'] as String,
      type: json['type'] as String,
      courseId: json['id_No'] as String,
    );
  }
}
