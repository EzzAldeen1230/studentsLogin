import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:student_app/dataProviders/error/failures.dart';
import 'package:student_app/fetures/user/data/models/UserModel.dart';
import 'package:student_app/fetures/user/data/repositories/RegistrationRepository.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegistrationRepository repository;

  RegisterBloc({required this.repository})
      : assert(repository != null),
        super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is LoginRequest) {
      final failureOrData = await repository.sendLoginRequest(
        email: event.email.toString(),
        password: event.password.toString(),
      );

      yield* failureOrData.fold(
            (failure) async* {
          yield RegisterError(message: mapFailureToMessage(failure));
        },
            (data) async* {
          yield RegisterLoaded(message: 'تم تسجيل الدخول بنجاح');
        },
      );
    }
  }
}
