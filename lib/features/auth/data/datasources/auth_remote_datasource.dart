import 'package:clean_arch_testing/core/errors/exceptions.dart';
import 'package:clean_arch_testing/features/auth/data/dtos/user_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDatasource {
  Future<UserDto> authWithEmail(String email, String password);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDatasourceImpl({required this.firebaseAuth});

  @override
  Future<UserDto> authWithEmail(String email, String password) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user == null) throw ServerException(message: 'not-found');

      return UserDto(id: result.user!.uid, email: result.user!.email ?? email);
    } on ServerException catch (_) {
      rethrow;
    } catch (e) {
      throw ServerException(message: '$e');
    }
  }
}
