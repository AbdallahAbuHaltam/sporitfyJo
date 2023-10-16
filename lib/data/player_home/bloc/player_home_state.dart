part of 'player_home_bloc.dart';

@immutable
sealed class PlayerHomeState {}

final class PlayerHomeInitial extends PlayerHomeState {}

class LoadingState extends PlayerHomeState {}

class FailureState extends PlayerHomeState {}

class LoadedAllPlaygroundState extends PlayerHomeState {
  final List<PlaygroundInfo> playgroungList;

  LoadedAllPlaygroundState({required this.playgroungList});
}
