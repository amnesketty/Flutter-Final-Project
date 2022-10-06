import 'package:lounga/domain/entities/user_transaction.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<User> login(String username, String password);
  Future<int> register(String firstName, String lastName, String username,
      String email, String phone, String password);
  Future<UserTransaction> getUserTransaction(String token);
}
