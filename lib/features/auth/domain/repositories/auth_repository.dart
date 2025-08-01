import 'package:clean_arch_testing/core/errors/failures.dart';
import 'package:clean_arch_testing/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> loginWithEmail(String email, String password);
}
