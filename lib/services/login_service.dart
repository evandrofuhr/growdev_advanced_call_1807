import 'package:call_1807/data/mock_data.dart';

class LoginService {
  Future<bool> signIn({String email, String password}) async {
    MockData.logedUser = null;
    await Future.delayed(Duration(milliseconds: 500), () {
      MockData.logedUser = MockData.users.firstWhere(
          (e) => e.email == email && e.password == password,
          orElse: () => null);
    });
    return MockData.logedUser != null;
  }

  Future<void> signOut() async {
    await Future.delayed(
        Duration(milliseconds: 500), () => MockData.logedUser = null);
  }
}
