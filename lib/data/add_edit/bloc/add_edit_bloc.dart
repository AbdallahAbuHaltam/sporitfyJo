// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sportify/data/add_edit/add_edit_model/playground_model.dart';
import 'package:sportify/data/add_edit/add_edit_repository/add_edit_repository.dart';
import 'package:sportify/shared_preference/shared_preference.dart';

part 'add_edit_event.dart';
part 'add_edit_state.dart';

class AddEditBloc extends Bloc<AddEditEvent, AddEditState> {
  AddEditBloc() : super(AddEditInitial()) {
    on<ChoosingImageEvent>(_handelPickImage);
    on<AddPlaygroundEvent>(_handelAddPlayground);
    on<EditPlaygroundEvent>(_handelEditPlayground);
  }
}

Future<void> _handelPickImage(
    ChoosingImageEvent event, Emitter<AddEditState> emit) async {
  try {
    String? image = await AddEditRepository.uploadImage();
    emit(PickedImageState(image: image!));
  } catch (e) {
    print(e);
  }
}

Future<void> _handelAddPlayground(
    AddPlaygroundEvent event, Emitter<AddEditState> emit) async {
  emit(LoadingState());

  bool isUploaded = await AddEditRepository.addPlaygroundToFirestore(
      playgroundModel: event.playgroundModel);

  if (isUploaded) {
    emit(AddedPlaygroundState());
  } else {
    emit(FailureState());
  }
}

Future<void> _handelEditPlayground(
    EditPlaygroundEvent event, Emitter<AddEditState> emit) async {
  emit(LoadingState());

  bool isEdited =
      await AddEditRepository.updateEditPlayground(event.newPlaygroundModel);

  if (isEdited) {
    emit(EditPlaygroundSuccessfully());
  } else {
    emit(FailureState());
  }
}
