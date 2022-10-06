import 'dart:async';
import 'package:lounga/domain/repositories/users_repository.dart';
import 'package:lounga/domain/entities/user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class UserLogin extends UseCase<User, UserLoginParams> {
  final UserRepository repository;

  UserLogin(this.repository);

  @override
  Future<Stream<User>> buildUseCaseStream(UserLoginParams? params) async {
    final streamController = StreamController<User>();
    try {
      final user = await repository.login(params!.username, params.password);
      streamController.add(user);
      streamController.close();
    } catch (e, stackTrace) {
      logger.severe('StackTrace: $stackTrace');
      streamController.addError(e, stackTrace);
    }
    return streamController.stream;
  }
}

class UserLoginParams {
  final String username;
  final String password;
  UserLoginParams(this.username, this.password);
}
