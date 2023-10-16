part of 'player_home_bloc.dart';

@immutable
sealed class PlayerHomeEvent {}

class LoadAllPlaygroundEvent extends PlayerHomeEvent {}
