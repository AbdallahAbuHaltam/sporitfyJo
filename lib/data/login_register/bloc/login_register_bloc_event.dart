// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_register_bloc_bloc.dart';

@immutable
sealed class LoginRegisterBlocEvent {}

class OwnerSignUpEvent extends LoginRegisterBlocEvent {
  final String email;
  final String password;
  final OwnerInfo ownerInfo;
  final MainPlaygroundModel playgroundModel;

  OwnerSignUpEvent({
    required this.email,
    required this.password,
    required this.ownerInfo,
    required this.playgroundModel,
  });
}

class CreateNewPlaygroundEvent extends LoginRegisterBlocEvent {
  final MainPlaygroundModel playgroundModel;
  final String email;
  final String password;

  CreateNewPlaygroundEvent({
    required this.playgroundModel,
    required this.email,
    required this.password,
  });
}

class PlayerSignUpEvent extends LoginRegisterBlocEvent {
  final String email;
  final String password;
  final PlayerInfo playerInfo;
  PlayerSignUpEvent({
    required this.email,
    required this.password,
    required this.playerInfo,
  });
}

class LogoutEvent extends LoginRegisterBlocEvent {}

class LoginSuccessEvent extends LoginRegisterBlocEvent {
  final String email;
  final String password;

  LoginSuccessEvent({required this.email, required this.password});
}
