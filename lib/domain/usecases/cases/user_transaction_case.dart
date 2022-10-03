import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lounga/domain/repositories/users_repository.dart';
import '../../entities/user_transaction.dart';

class UserTransactionCase extends UseCase<UserTransaction, UserTransactionParams> {
  final UserRepository repository;

  UserTransactionCase(this.repository);
  
  @override
  Future<Stream<UserTransaction?>> buildUseCaseStream(UserTransactionParams? params) async {
    final streamController = StreamController<UserTransaction>();
    print(params!.token);
    try {
      final userTransaction = await repository.getUserTransaction(params!.token);
      streamController.add(userTransaction);
      streamController.close();
      print(userTransaction.username);
    } catch (e, stackTrace) {
      logger.severe('StackTrace : $stackTrace');
      streamController.addError(e, stackTrace);
    }
    return streamController.stream;
  }
}

class UserTransactionParams {
  final String token;
  UserTransactionParams(this.token);
}