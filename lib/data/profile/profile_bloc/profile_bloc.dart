import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sportify/data/login_register/login_register_models/player/player_model.dart';
import 'package:sportify/data/profile/profile_repository/pofile_repository.dart';

import '../../login_register/login_register_models/owner/owner_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<LoadCustomerProfileEvent>(_handelLoadedCustomerProfileDats);
    on<LoadOwnerProfileEvent>(_handelLoadedOwnerProfileDats);
    on<ChangeNameEvent>(_handelChangeOfName);
  }
}

Future<void> _handelLoadedCustomerProfileDats(
    LoadCustomerProfileEvent event, Emitter<ProfileState> emit) async {
  emit(LoadingProfileDataState());
  try {
    PlayerInfo playerInfo = await ProfileRepository.customerInformation();
    emit(LoadedCustomerProfileDataState(playerInfo: playerInfo));
  } catch (e) {
    emit(FailedLoadingProfileData());
    print(e);
  }
}

Future<void> _handelLoadedOwnerProfileDats(
    LoadOwnerProfileEvent event, Emitter<ProfileState> emit) async {
  emit(LoadingProfileDataState());
  try {
    OwnerInfo ownerInfo = await ProfileRepository.ownerInformation();
    emit(LoadedOwnerProfileDataState(ownerInfo: ownerInfo));
  } catch (e) {
    emit(FailedLoadingProfileData());
    print(e);
  }
}

Future<void> _handelChangeOfName(
    ChangeNameEvent event, Emitter<ProfileState> emit) async {
  emit(LoadingProfileDataState());
  try {
    if (event.isOwner) {
      await ProfileRepository.updateNameOfUser(event.nameOfUser, true);
      emit(ChangeNameState(nameOfUser: event.nameOfUser));
    } else {
      await ProfileRepository.updateNameOfUser(event.nameOfUser, false);
      emit(ChangeNameState(nameOfUser: event.nameOfUser));
    }
  } catch (e) {
    emit(FailedLoadingProfileData());
    print(e);
  }
}
