class FeedbackForm {
  String fullname;
  String employmentid;
  String mobilenumber;
  String age;
  String department;
  String yearofjoining;

  FeedbackForm(this.fullname, this.employmentid, this.mobilenumber, this.age,
      this.department, this.yearofjoining);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm(
        "${json['fullname']}",
        "${json['employmentid']}",
        "${json['mobileNumber']}",
        "${json['age']}",
        "${json['department']}",
        "${json['yearofjoining']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
        'fullname': fullname,
        'employmentid': employmentid,
        'mobilenumber': mobilenumber,
        'age': age,
        'department': department,
        'yearofjoining': yearofjoining,
      };
}
