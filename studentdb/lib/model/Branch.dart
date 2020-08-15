class Branch {
  String course, courseID;
  Branch({this.course, this.courseID});
  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      course: json['course'] as String,
      courseID: json['courseId'] as String,
    );
  }
}
