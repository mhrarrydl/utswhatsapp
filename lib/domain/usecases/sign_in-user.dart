import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_clone/domain/entities/user_entity.dart';
import 'package:whatsapp_clone/domain/repositories/user_repository.dart';

class SignInUser{
  final UserRepository userRepository;

  SignInUser(this.userRepository);
  Future<User?> call(String email,String password){
    return userRepository.signInUser(email, password);
  }
}