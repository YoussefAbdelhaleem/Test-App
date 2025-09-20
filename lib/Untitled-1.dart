import 'dart:io';

void main() {
  List users = [
    {"username": "wael", "password": "123"},
    {"username": "rehan", "password": "1234"},
    {"username": "yousef", "password": "12345"},
  ];

  print("Enter your username:");
  String? username = stdin.readLineSync();
  print("Enter your password:");
  String? password = stdin.readLineSync();

  var res = users.firstWhere(
    (element) => element["username"] == username,
    orElse: () => null,
  );
  if (res == null) {
    print("User not found");
  } else {
    if (res["password"] == password) {
      print("Login successful");
    } else {
      print("Incorrect password");
    }
  }
}
