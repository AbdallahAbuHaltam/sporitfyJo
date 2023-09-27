// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'type_of_user_bloc.dart';

@immutable
sealed class TypeOfUserEvent {}

class UserTypeEvent extends TypeOfUserEvent {
final bool isOwner;
  UserTypeEvent({
    required this.isOwner,
  });
}
