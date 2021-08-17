import 'dart:io';

void main() {
  print('Whats Your name:');
  String name = stdin.readLineSync()!;
  print('Loading......');
  sleep(new Duration(seconds: 1));
  print("Your Name Is ${name}");
  sleep(new Duration(seconds: 1));
  print('You are a wonderful Mobile App Developer');
  sleep(new Duration(seconds: 1));
  print('Keep being awesome!');
}
