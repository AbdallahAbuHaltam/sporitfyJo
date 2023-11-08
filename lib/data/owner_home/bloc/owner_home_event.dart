part of 'owner_home_bloc.dart';

@immutable
sealed class OwnerHomeEvent {}

class LoadAllPlaygroundEvent extends OwnerHomeEvent {}

class DeletePlaygroundEvent extends OwnerHomeEvent {
  final String playgroundUID;

  DeletePlaygroundEvent({required this.playgroundUID});
}
