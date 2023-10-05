// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_edit_bloc.dart';

@immutable
sealed class AddEditState {}

final class AddEditInitial extends AddEditState {}

class PickedImageState extends AddEditState {
  final File image;
  PickedImageState({
    required this.image,
  });
}

class LoadingState extends AddEditState {}

class FailureState extends AddEditState {}

class AddedPlaygroundState extends AddEditState {}
