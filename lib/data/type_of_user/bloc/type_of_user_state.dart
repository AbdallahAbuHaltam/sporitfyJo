// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'type_of_user_bloc.dart';

@immutable
sealed class TypeOfUserState {}

final class TypeOfUserInitial extends TypeOfUserState {}

class ChoosingOwner extends TypeOfUserState {
  final bool isOwner;
  ChoosingOwner({
    required this.isOwner,
  });
}

class ChoosingPlayer extends TypeOfUserState {
  final bool isOwner;
  ChoosingPlayer({
    required this.isOwner,
  });
  
}
