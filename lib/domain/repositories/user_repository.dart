import 'package:firebase_auth/firebase_auth.dart';
import '../../data/models/user_model.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<User?> registerUser(String email, String password, UserEntity userEntity);
  Future<User?> signInUser(String email, String password);
  Future<UserModel?> getUser(String userId);
}