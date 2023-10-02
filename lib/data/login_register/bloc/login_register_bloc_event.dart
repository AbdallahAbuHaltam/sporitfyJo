// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_register_bloc_bloc.dart';

@immutable
sealed class LoginRegisterBlocEvent {}


class OwnerSignUpEvent extends LoginRegisterBlocEvent{
  final String email;
  final String password;
  final OwnerInfo ownerInfo;

  OwnerSignUpEvent({required this.email, required this.password,required this.ownerInfo});

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

class LogoutEvent extends LoginRegisterBlocEvent{

}

class LoginSuccessEvent extends LoginRegisterBlocEvent{
  final String email;
  final String password;

  LoginSuccessEvent({ required this.email,required this.password});


}


