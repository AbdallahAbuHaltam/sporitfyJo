import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sportify/data/add_edit/add_edit_model/playground_model.dart';

import '../owner_home_repository/owner_home_repository.dart';

part 'owner_home_event.dart';
part 'owner_home_state.dart';

class OwnerHomeBloc extends Bloc<OwnerHomeEvent, OwnerHomeState> {
  OwnerHomeBloc() : super(OwnerHomeInitial()) {
    on<LoadAllPlaygroundEvent>(_handelFetchAllPlayground);
  }
}

Future<void> _handelFetchAllPlayground(
    LoadAllPlaygroundEvent event, Emitter<OwnerHomeState> emit) async {
  emit(LoadingState());

  List<PlaygroundInfo> playgroundList =
      await OwnerHomeRepository.fetchAllPlaygroundFromFirestore();

  emit(LoadedAllPlaygroundState(playgroungList: playgroundList));
}