import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_clone/domain/entities/user_entity.dart';
import 'package:whatsapp_clone/domain/repositories/user_repository.dart';

class RegisterUser{
  final UserRepository userRepository;

  RegisterUser(this.userRepository);
 Future<User?> call(String email,String password,UserEntity userEntity){
 return userRepository.registerUser(email, password, userEntity);
 }
}