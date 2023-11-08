part of 'owner_home_bloc.dart';

@immutable
sealed class OwnerHomeState {}

final class OwnerHomeInitial extends OwnerHomeState {}

class LoadingState extends OwnerHomeState {}

class FailureState extends OwnerHomeState {}

class LoadedAllPlaygroundState extends OwnerHomeState {
  final List<SubPlaygroundModel> playgroungList;

  LoadedAllPlaygroundState({required this.playgroungList});
}

class DeletedPlaygroundSuccessfully extends OwnerHomeState {}
