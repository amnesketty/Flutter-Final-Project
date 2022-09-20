import 'dart:html';

import 'package:dio/dio.dart';
import 'package:lounga/domain/repositories/users_repository.dart';
import '../../domain/entities/user.dart';
import '../misc/endpoints.dart';

class DataUserRepository extends UserRepository {
  final Endpoints endpoints;
  final Dio dio;

  DataUserRepository({required this.endpoints, required this.dio});

  @override
  Future<User> login(String username, String password) async {
    try {
      final response = await dio.post(
        endpoints.login,
        data: {
          "username" : username,
          "password" : password
        });
      final user = response.data['data'] as User;
      return user;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}