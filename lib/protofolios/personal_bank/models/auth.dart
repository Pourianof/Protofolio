import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/holder.dart';
import 'package:my_portfolio/protofolios/personal_bank/providers/user_provider.dart';

class AuthState {
  final bool twoFactorAuthState;
  AuthState({
    required this.twoFactorAuthState,
  });

  copyWith({bool? newTwoFactorAuthState}) {
    return AuthState(
      twoFactorAuthState: newTwoFactorAuthState ?? twoFactorAuthState,
    );
  }
}

class Auth extends ChangeNotifier with Holder<AuthState> {
  AuthState? _authState;
  Auth({
    AuthState? authState,
  }) {
    _authState = authState;
  }

  calculateChanges() {}

  AuthState get authState {
    _authState ??= AuthState(twoFactorAuthState: true);

    return _authState!;
  }

  UserProvider? _userProvider;
  UserProvider get userProvider {
    _userProvider ??= UserProvider(auth: this);

    return _userProvider!;
  }
}
