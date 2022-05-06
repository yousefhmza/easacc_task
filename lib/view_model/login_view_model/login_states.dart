abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginFailureState extends LoginStates {
  final String errorMessage;

  LoginFailureState(this.errorMessage);
}

class LoginSuccessState extends LoginStates {}

class LogoutLoadingState extends LoginStates {}

class LogoutFailureState extends LoginStates {
  final String errorMessage;

  LogoutFailureState(this.errorMessage);
}

class LogoutSuccessState extends LoginStates {}
