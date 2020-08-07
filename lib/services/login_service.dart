import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:call_1807/models/state.dart';
import 'package:call_1807/services/app_state_repository.dart';
import 'package:call_1807/utils/network_helper.dart';

class Result<T> {
  bool status;
  String message;
  T data;
  Result({this.status, this.message, this.data});
}

class LoginService {
  final _appStateRepository = AppStateRepository();
  Future<Result<String>> signIn({String email, String password}) async {
    final result = Result<String>(status: false, message: 'Erro indefinido');
    try {
      final dio = NetworkHelper.getDioInstance();
      final jsonData = JsonEncoder().convert(
        {'email': email, 'password': password},
      );
      final response = await dio.post('/login', data: jsonData);
      if (response.statusCode == 200) {
        result.data = response.data['token'].toString();
        result.status = true;
      }
    } on DioError catch (ex) {
      if (ex.response.statusCode == 401) {
        result.message = ex.response.data['error'].toString();
      } else {
        result.message = ex.response.statusMessage;
      }
    } on Exception catch (ex) {
      result.message = ex.toString();
    }
    if (result.status && (result.data?.isNotEmpty ?? false)) {
      await _appStateRepository.save(
        AppState(
          email: email,
          token: result.data,
        ),
      );
    }
    return result;
  }

  Future<void> signOut() async {
    await _appStateRepository.clear();
  }
}
