import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lounga/domain/entities/user_transaction.dart';
import 'package:lounga/domain/usecases/cases/user_transaction_case.dart';

class HomePresenter extends Presenter {
  late Function(UserTransaction?) onSuccessUserTransaction;
  late Function(dynamic error) onErrorUserTransaction;
  late Function() onFinishUserTransaction;

  final UserTransactionCase userTransactionCase;

  HomePresenter({required this.userTransactionCase});

  void getUserTransaction(String token) {
    userTransactionCase.execute(_HomeObserver(this), UserTransactionParams(token));
  }

  @override
  void dispose() {
    userTransactionCase.dispose();
  }
}

class _HomeObserver extends Observer<UserTransaction> {
  final HomePresenter presenter;

  _HomeObserver(this.presenter);
  
  @override
  void onComplete() {
    presenter.onFinishUserTransaction();
  }
  
  @override
  void onError(e) {
    presenter.onErrorUserTransaction(e);
  }
  
  @override
  void onNext(UserTransaction? response) {
    UserTransaction? userTransaction = response;
    presenter.onSuccessUserTransaction(userTransaction);
  }
}