import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sportify/data/login_register/login_register_models/owner/owner_model.dart';
import 'package:sportify/data/login_register/login_register_models/player/player_model.dart';

part 'login_register_bloc_event.dart';
part 'login_register_bloc_state.dart';

class LoginRegisterBlocBloc extends Bloc<LoginRegisterBlocEvent, LoginRegisterBlocState> {
  LoginRegisterBlocBloc() : super(LoginRegisterBlocInitial()) {
    on<LoginRegisterBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
