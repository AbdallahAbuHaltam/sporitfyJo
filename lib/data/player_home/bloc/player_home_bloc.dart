import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../add_edit/add_edit_model/main_playground_model.dart';
import '../player_home_repository/player_home_repository.dart';

part 'player_home_event.dart';
part 'player_home_state.dart';

class PlayerHomeBloc extends Bloc<PlayerHomeEvent, PlayerHomeState> {
  PlayerHomeBloc() : super(PlayerHomeInitial()) {
    on<LoadAllPlaygroundEvent>(_handelFetchAllPlayground);
  }
}

Future<void> _handelFetchAllPlayground(
    LoadAllPlaygroundEvent event, Emitter<PlayerHomeState> emit) async {
  try {
    emit(LoadingState());

    // List<MainPlaygroundModel> playgroundList =
    //     await PLayerHomeRepository.fetchAllPlaygroundFromFirestore();

    // emit(LoadedAllPlaygroundState(playgroungList: playgroundList));
  } catch (e) {
    print(e.toString());
  }
}
