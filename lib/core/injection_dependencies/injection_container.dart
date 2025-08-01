import 'package:clean_arch_testing/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:clean_arch_testing/features/auth/data/repositories/auth_respository_impl.dart';
import 'package:clean_arch_testing/features/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch_testing/features/auth/domain/use_cases/login_with_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(firebaseAuth: sl()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRespositoryImpl(authRemoteDatasource: sl()),
  );
  sl.registerLazySingleton(() => LoginWithEmail(authRepository: sl()));
}
