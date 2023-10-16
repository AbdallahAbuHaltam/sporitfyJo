import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../add_edit/add_edit_model/playground_model.dart';
import '../player_home_repository/player_home_repository.dart';

part 'player_home_event.dart';
part 'player_home_state.dart';

class PlayerHomeBloc extends Bloc<PlayerHomeEvent, PlayerHomeState> {
  PlayerHomeBloc() : super(PlayerHomeInitial()) {
    on<PlayerHomeEvent>((event, emit) {
      on<LoadAllPlaygroundEvent>(_handelFetchAllPlayground);
    });
  }
}

Future<void> _handelFetchAllPlayground(
    LoadAllPlaygroundEvent event, Emitter<PlayerHomeState> emit) async {
  emit(LoadingState());

  List<PlaygroundInfo> playgroundList =
      await PlayerRepository.fetchAllPlaygroundFromFirestore();

  emit(LoadedAllPlaygroundState(playgroungList: playgroundList));
}
