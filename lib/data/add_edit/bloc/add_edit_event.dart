part of 'add_edit_bloc.dart';

@immutable
sealed class AddEditEvent {}

class ChoosingImageEvent extends AddEditEvent {}

class AddPlaygroundEvent extends AddEditEvent {
  final PlaygroundInfo playgroundModel;

  AddPlaygroundEvent({required this.playgroundModel});
}

class EditPlaygroundEvent extends AddEditEvent {
  final PlaygroundInfo newPlaygroundModel;

  EditPlaygroundEvent({required this.newPlaygroundModel});
}
