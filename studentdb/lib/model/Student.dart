class Student {
  String Name, BranchID, ID_NO, Section;
  int Roll_no;
  Student({this.Name, this.BranchID, this.ID_NO, this.Section, this.Roll_no});
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      Name: json['name'] as String,
      BranchID: json['branch'] as String,
      ID_NO: json['iDNO'] as String,
      Section: json['section'] as String,
      Roll_no: json['rollno'] as int,
    );
  }
}
