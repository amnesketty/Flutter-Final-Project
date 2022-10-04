import 'package:dio/dio.dart';
import 'package:lounga/domain/entities/user_transaction.dart';
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
          token: userResponse['token'],
          avatarImage: userResponse['avatarImage']);
      return user;
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<int> register(String firstName, String lastName, String username, String email, String phone, String password) async {
    try {
      final response = await dio.post(
        endpoints.register,
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

  @override
  Future<UserTransaction> getUserTransaction(String token) async {
    dio.options.headers['Authorization'] =
        'Bearer $token';
    try {
      final response = await dio.post(
        endpoints.userTransaction
      );
      final userTransactionResponse = response.data['data'] as UserTransaction;
      print(userTransactionResponse.username);
      return userTransactionResponse;
    } catch (e) {
      rethrow;
    }
    // TODO: implement getUserTransaction
    throw UnimplementedError();
  }
}
