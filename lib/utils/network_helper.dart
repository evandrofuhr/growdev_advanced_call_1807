import 'package:call_1807/models/state.dart';
import 'package:dio/dio.dart';

abstract class NetworkHelper {
  static Dio getDioInstance({AppState appState}) {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api-cards-growdev.herokuapp.com',
        headers: _defaultHeaders(appState: appState),
      ),
    );
  }

  static Map<String, dynamic> _defaultHeaders({AppState appState}) {
    final Map<String, dynamic> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (appState?.token?.isNotEmpty ?? false) {
      header.addAll({'Authorization': 'Token ${appState.token}'});
    }
    return header;
  }
}
