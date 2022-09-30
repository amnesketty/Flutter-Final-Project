import 'package:dio/dio.dart';
import 'package:lounga/domain/repositories/users_repository.dart';
import '../../domain/entities/user.dart';
import '../misc/endpoints.dart';

class DataUserRepository implements UserRepository {
  final Endpoints endpoints;
  final Dio dio;

  DataUserRepository({required this.endpoints, required this.dio});

  @override
  Future<User> login(String username, String password) async {
    try {
      final response = await dio.post(endpoints.login,
          data: {"username": username, "password": password});
      final userResponse = response.data['data'] as Map<String, dynamic>;
      User user = User(
          firstName: userResponse['firstName'],
          lastName: userResponse['lastName'],
          email: userResponse['email'],
          phone: userResponse['phone'],
          token: userResponse['token']);
      return user;
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<int> register(String firstName, String lastName, String username, String email, String phone, String password) async {
    try {
      final response = await dio.post(endpoints.login,
          data: {
            "firstName": firstName,
            "lastName": lastName,
            "username": username,
            "email": email,
            "phone": phone,
            "password": password
            });
      final userResponse = response.data['data'] as int;
      return userResponse;
    } catch (e) {
      rethrow;
    }
  }
}
