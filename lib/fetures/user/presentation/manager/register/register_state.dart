part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoaded extends RegisterState {
  final  String message;

  RegisterLoaded({required this.message});

  @override
  List<Object> get props => [message];
}

class RegisterError extends RegisterState {
  final String message;

  RegisterError({required this.message});

  @override
  bool operator ==(Object other) {
    return false;
  }

  @override
  List<Object> get props => [message];
}