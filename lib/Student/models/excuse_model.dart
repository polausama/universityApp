
class Excuse {
  final String className;
  final String classNum;
  final String studentNum;
  final String day;
  final String time;
  final String date;
  final String status;

  Excuse({
    required this.className,
    required this.classNum,
    required this.status,
    required this.studentNum,
    required this.day,
    required this.time,
    required this.date,
  });
}
final excusesList = [
  Excuse(
    className: "Math",
    classNum: "101",
    status: "Accepted",
    studentNum: "30",
    day: "Monday",
    time: "10:00 AM",
    date: "12-03-2023"
  ),
  Excuse(
    className: "Math",
    classNum: "101",
    status: "Rejected",
    studentNum: "30",
    day: "Monday",
    time: "10:00 AM",
      date: "12-03-2023"
  ),
  Excuse(
    className: "Math",
    classNum: "101",
    status: "Rejected",
    studentNum: "30",
    day: "Monday",
    time: "10:00 AM",
      date: "12-03-2023"
  ),
];