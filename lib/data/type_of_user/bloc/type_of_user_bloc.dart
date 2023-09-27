import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'type_of_user_event.dart';
part 'type_of_user_state.dart';

class TypeOfUserBloc extends Bloc<TypeOfUserEvent, TypeOfUserState> {
  TypeOfUserBloc() : super(TypeOfUserInitial()) {
    on<UserTypeEvent>((event, emit) {
      if(event.isOwner){
        emit(ChoosingOwnerState(isOwner: true));
      }
      else{
        emit(ChoosingPlayerState(isOwner: false));
      }
    });
  }
}
