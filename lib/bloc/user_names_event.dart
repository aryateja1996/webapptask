part of 'user_names_bloc.dart';

@immutable
abstract class UserNamesEvent extends Equatable {}

class Get extends UserNamesEvent {
  @override
  List<Object?> get props => [];
}
