import '../utils/extensions.dart';

class User {
  String email;
  String name;
  String password;
  String get avatarUrl =>
      'https://gravatar.com/avatar/${(email ?? '').toMD5()}?d=robohash';

  User({
    this.email,
    this.name,
    this.password,
  });
}
