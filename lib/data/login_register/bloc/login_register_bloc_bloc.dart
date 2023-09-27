import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_register_bloc_event.dart';
part 'login_register_bloc_state.dart';

class LoginRegisterBlocBloc extends Bloc<LoginRegisterBlocEvent, LoginRegisterBlocState> {
  LoginRegisterBlocBloc() : super(LoginRegisterBlocInitial()) {
    on<LoginRegisterBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
