// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'type_of_user_bloc.dart';

@immutable
sealed class TypeOfUserState {}

final class TypeOfUserInitial extends TypeOfUserState {}

class ChoosingOwnerState extends TypeOfUserState {
  final bool isOwner;
  ChoosingOwnerState({
    required this.isOwner,
  });
}

class ChoosingPlayerState extends TypeOfUserState {
  final bool isOwner;
  ChoosingPlayerState({
    required this.isOwner,
  });
  
}
