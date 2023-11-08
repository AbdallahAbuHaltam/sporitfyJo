import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sportify/data/add_edit/add_edit_model/main_playground_model.dart';
import 'package:sportify/data/login_register/login_register_models/owner/owner_model.dart';
import 'package:sportify/data/login_register/login_register_models/player/player_model.dart';
import 'package:sportify/data/login_register/login_register_repo/owner_repo/owner_repository.dart';

import '../login_register_repo/login_repo/login_repository.dart';
import '../login_register_repo/player_repo/player_repository.dart';

part 'login_register_bloc_event.dart';
part 'login_register_bloc_state.dart';

class LoginRegisterBlocBloc
    extends Bloc<LoginRegisterBlocEvent, LoginRegisterBlocState> {
  LoginRegisterBlocBloc() : super(LoginRegisterBlocInitial()) {
    on<OwnerSignUpEvent>(_handleOwnerSignUpEvent);
    // on<CreateNewPlaygroundEvent>(_handelCreateNewPlayground);
    on<PlayerSignUpEvent>(_handlePlayerSignUpEvent);
    on<LoginSuccessEvent>(_handleLoginSuccessEvent);
    on<LogoutEvent>(_handleLogoutEvent);
  }

  FutureOr<void> _handleOwnerSignUpEvent(
      OwnerSignUpEvent event, Emitter<LoginRegisterBlocState> emit) async {
    emit(LoginRegisterLoading());

    bool isUploaded =
        await LoginOwnerRegisterationRepository.isOwnerDataUploadedToFirestore(
            ownerModel: event.ownerInfo,
            playgroundModel: event.playgroundModel);

    if (isUploaded) {
      emit(LoginRegisterLoaded());
    } else {
      emit(LoginRegisterFailure());
    }
  }

  // FutureOr<void> _handelCreateNewPlayground(CreateNewPlaygroundEvent event,
  //     Emitter<LoginRegisterBlocState> emit) async {
  //   emit(LoginRegisterLoading());

  //   bool isPlaygroundUploaded =
  //       await LoginOwnerRegisterationRepository.isNewPlaygroundCreated(
  //           email: event.email,
  //           password: event.password,
  //           playgroundModel: event.playgroundModel);

  //   if (isPlaygroundUploaded) {
  //     emit(CreateNewPlaygroundState());
  //   } else {
  //     emit(LoginRegisterFailure());
  //   }
  // }

  FutureOr<void> _handlePlayerSignUpEvent(
      PlayerSignUpEvent event, Emitter<LoginRegisterBlocState> emit) async {
    emit(LoginRegisterLoading());

    bool isUploaded = await LoginPlayerRegisterationRepository
        .isPlayerDataUploadedToFirestore(playerModel: event.playerInfo);

    if (isUploaded) {
      emit(LoginRegisterLoaded());
    } else {
      emit(LoginRegisterFailure());
    }
  }

  FutureOr<void> _handleLoginSuccessEvent(
      LoginSuccessEvent event, Emitter<LoginRegisterBlocState> emit) async {
    bool isSuccessful = await LoginRepository.isLoginSuccessful(
        email: event.email, password: event.password);

    if (isSuccessful) {
      emit(LoginRegisterLoaded());
    } else {
      emit(LoginRegisterFailure());
    }
  }

  FutureOr<void> _handleLogoutEvent(
      LogoutEvent event, Emitter<LoginRegisterBlocState> emit) async {
    try {
      LoginOwnerRegisterationRepository.removeData('currentUID');
      emit(LogoutState());
    } catch (_) {}
  }
}
