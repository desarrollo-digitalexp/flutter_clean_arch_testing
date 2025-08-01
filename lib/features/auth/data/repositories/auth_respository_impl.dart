import 'package:clean_arch_testing/core/errors/failures.dart';
import 'package:clean_arch_testing/features/auth/domain/entities/user_entity.dart';
import 'package:clean_arch_testing/features/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch_testing/features/auth/data/datasources/auth_remote_datasource.dart';

import 'package:dartz/dartz.dart';

class AuthRespositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  AuthRespositoryImpl({required this.authRemoteDatasource});

  @override
  Future<Either<Failure, UserEntity>> loginWithEmail(
    String email,
    String password,
  ) async {
    try {
      return Right(await authRemoteDatasource.authWithEmail(email, password));
    } catch (e) {
      return Left(ServerFailure(message: '$e'));
    }
  }
}
