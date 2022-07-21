part of 'user_names_bloc.dart';

@immutable
abstract class UserNamesState extends Equatable {}

class UserNamesInitial extends UserNamesState {
  @override
  List<Object?> get props => [];
}

class Loading extends UserNamesState {
  @override
  List<Object?> get props => [];
}

class Loaded extends UserNamesState {
  final List<User> user;
  Loaded({
    required this.user,
  });
  @override
  List<Object?> get props => [];
}

class Error extends UserNamesState {
  final String error;
  Error({required this.error});
  @override
  List<Object?> get props => [];
}
