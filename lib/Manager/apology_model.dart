
class Apology {
  final String className;
  final String classNum;
  final String studentNum;
  final String day;
  final String time;
  final String date;
  final String Message;

  Apology({
    required this.className,
    required this.classNum,
    required this.Message,
    required this.studentNum,
    required this.day,
    required this.time,
    required this.date,
  });
}
final excusesList = [
  Apology(
      className: "Math",
      classNum: "101",
      Message: "Accepted",
      studentNum: "30",
      day: "Monday",
      time: "10:00 AM",
      date: "12-03-2023"
  ),
  Apology(
      className: "Math",
      classNum: "101",
      Message: "Rejected",
      studentNum: "30",
      day: "Monday",
      time: "10:00 AM",
      date: "12-03-2023"
  ),
  Apology(
      className: "Math",
      classNum: "101",
      Message: "Rejected",
      studentNum: "30",
      day: "Monday",
      time: "10:00 AM",
      date: "12-03-2023"
  ),
];