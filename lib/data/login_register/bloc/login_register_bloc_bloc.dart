import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sportify/data/login_register/login_register_models/owner/owner_model.dart';
import 'package:sportify/data/login_register/login_register_models/player/player_model.dart';

part 'login_register_bloc_event.dart';
part 'login_register_bloc_state.dart';

class LoginRegisterBlocBloc extends Bloc<LoginRegisterBlocEvent, LoginRegisterBlocState> {
  LoginRegisterBlocBloc() : super(LoginRegisterBlocInitial()) {
    on<OwnerSignUpEvent>(_handleOwnerSignUpEvent);
    on<PlayerSignUpEvent>(_handlePlayerSignUpEvent);
    on<LoginSuccessEvent>(_handleLoginSuccessEvent);
    on<LogoutEvent>(_handleLogoutEvent);
  }

  FutureOr<void> _handleOwnerSignUpEvent(OwnerSignUpEvent event, Emitter<LoginRegisterBlocState> emit) async{
  }

  FutureOr<void> _handlePlayerSignUpEvent(PlayerSignUpEvent event, Emitter<LoginRegisterBlocState> emit)async {
  }

  FutureOr<void> _handleLoginSuccessEvent(LoginSuccessEvent event, Emitter<LoginRegisterBlocState> emit)async {
  }

  FutureOr<void> _handleLogoutEvent(LogoutEvent event, Emitter<LoginRegisterBlocState> emit)async {
  }
}
