import 'package:flutter_login_interface/flutter_login_interface.dart';

/// A Calculator.
class LoginService<T> {
  static LoginService<T> forDatasource<T>({
    required LoginInterface<T> dataSource,
  }) {
    return LoginService<T>._(dataSource);
  }

  static LoginService<String> standard() {
    return LoginService._(LoginDefaultDataProvider());
  }

  LoginService._(LoginInterface<T> data) : dataSource = data;

  LoginInterface<T> dataSource;

  Future<T?> loginWithEmailAndPassword(String email, String password) async {
    var result = await dataSource.loginWithEmailAndPassword(
        EmailPasswordLogin(email: email, password: password));
    if (result.loginSuccessful) {
      return result.userObject;
    }
    return null;
  }

  Future<bool> requestChangePassword(String email) async {
    return dataSource.requestPasswordReset(email);
  }
}
