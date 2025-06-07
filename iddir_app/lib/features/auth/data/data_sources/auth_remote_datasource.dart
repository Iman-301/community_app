import 'package:dio/dio.dart';
import '../models/user_model.dart';

class AuthRemoteDatasource {
  final Dio dio;
  AuthRemoteDatasource(this.dio);

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await dio.post('/auth/login', data: {
      'email': email,
      'password': password,
    });
    print(response.data);
    return response.data; // contains 'token' and 'user'
  }

  Future<Map<String, dynamic>> register(Map<String, dynamic> data) async {
    final response = await dio.post('/auth/register', data: data);
    print(response.data);
    return response.data; // contains 'token' and 'user'
  }

  Future<UserModel> getMe(String token) async {
    final response = await dio.get('/auth/me', options: Options(
      headers: {'Authorization': 'Bearer $token'},
    ));
    return UserModel.fromJson(response.data);
  }
}