import 'package:call_1807/data/mock.dart';

class LoginService {
  Future<bool> signIn({String email, String password}) async {
    MockData.logedUser = null;
    await Future.delayed(Duration(milliseconds: 300), () {
      MockData.logedUser = MockData.users.firstWhere(
          (e) => e.email == email && e.password == password,
          orElse: () => null);
    });
    return MockData.logedUser != null;
  }

  Future<void> signOut() async {
    await Future.delayed(
        Duration(milliseconds: 300), () => MockData.logedUser = null);
  }
}
