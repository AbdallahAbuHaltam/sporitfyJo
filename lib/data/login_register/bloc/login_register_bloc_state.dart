part of 'login_register_bloc_bloc.dart';

@immutable
sealed class LoginRegisterBlocState {}

final class LoginRegisterBlocInitial extends LoginRegisterBlocState {}

final class LoginRegisterLoading extends LoginRegisterBlocState {}

final class LoginRegisterLoaded extends LoginRegisterBlocState {}

final class LoginRegisterFailure extends LoginRegisterBlocState {}

class LogoutState extends LoginRegisterBlocState {}

class CreateNewPlaygroundState extends LoginRegisterBlocState {}
