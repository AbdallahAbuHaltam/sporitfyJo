// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_register_bloc_bloc.dart';

@immutable
sealed class LoginRegisterBlocEvent {}


class OwnerSignUpEvent extends LoginRegisterBlocEvent{
  final String email;
  final String password;
  final OwnerInfo ownerInfo;

  OwnerSignUpEvent(this.email, this.password, this.ownerInfo);

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


