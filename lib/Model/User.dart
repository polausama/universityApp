
class UserInformation
{
  final String email;
  final String password;
  final String type;

  UserInformation({
    required this.email,
    required this.password,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'type': type,
    };
  }
}