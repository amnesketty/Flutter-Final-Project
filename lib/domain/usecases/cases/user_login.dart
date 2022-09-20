import 'dart:async';
import 'package:lounga/domain/repositories/users_repository.dart';
import 'package:lounga/domain/entities/user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class UserLogin extends UseCase<User, dynamic> {
  final UserRepository repository;

  UserLogin(this.repository);

  @override
  Future<Stream<User>> buildUseCaseStream(params) async {
    final streamController = StreamController<User>();

    try {
      final user = await repository.login("hafidz", "1345678");
      streamController.add(user);
      streamController.close();
    } catch (e, stackTrace) {
      logger.severe('StackTrace: $stackTrace');
      streamController.addError(e, stackTrace);
    }

    return streamController.stream;
  }
}