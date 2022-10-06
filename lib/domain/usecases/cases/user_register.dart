import 'dart:async';
import 'package:lounga/domain/repositories/users_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class UserRegister extends UseCase<int, UserRegisterParams> {
  final UserRepository repository;

  UserRegister(this.repository);

  @override
  Future<Stream<int>> buildUseCaseStream(UserRegisterParams? params) async {
    final streamController = StreamController<int>();
    try {
      final userId = await repository.register(
          params!.firstName,
          params.lastName,
          params.username,
          params.email,
          params.phone,
          params.password);
      streamController.add(userId);
      streamController.close();
    } catch (e, stackTrace) {
      logger.severe('StackTrace: $stackTrace');
      streamController.addError(e, stackTrace);
    }
    return streamController.stream;
  }
}

class UserRegisterParams {
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phone;
  final String password;
  UserRegisterParams(this.firstName, this.lastName, this.username, this.email,
      this.phone, this.password);
}
