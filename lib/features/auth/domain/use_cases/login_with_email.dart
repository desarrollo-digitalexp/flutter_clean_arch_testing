import 'package:clean_arch_testing/core/errors/failures.dart';
import 'package:clean_arch_testing/core/use_cases/params/auth_params.dart';
import 'package:clean_arch_testing/core/use_cases/use_case.dart';
import 'package:clean_arch_testing/features/auth/domain/entities/user_entity.dart';
import 'package:clean_arch_testing/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginWithEmail implements UseCase<Either<Failure, UserEntity>, LoginParams> {
  final AuthRepository authRepository;
  LoginWithEmail({required this.authRepository});

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params)async {
    return await authRepository.loginWithEmail(params.email, params.password);
  }

}