part of 'add_edit_bloc.dart';

@immutable
sealed class AddEditEvent {}

class ChoosingImageEvent extends AddEditEvent {}

class AddPlaygroundEvent extends AddEditEvent {
  final SubPlaygroundModel playgroundModel;

  AddPlaygroundEvent({required this.playgroundModel});
}

class EditPlaygroundEvent extends AddEditEvent {
  final SubPlaygroundModel newPlaygroundModel;

  EditPlaygroundEvent({required this.newPlaygroundModel});
}
