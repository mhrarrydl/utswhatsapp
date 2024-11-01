import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_clone/data/data_sources/firebase_data_source.dart';
import 'package:whatsapp_clone/data/models/user_model.dart';
import 'package:whatsapp_clone/domain/entities/user_entity.dart';
import 'package:whatsapp_clone/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  final FirebaseDataSource firebaseDataSource;

  UserRepositoryImpl(this.firebaseDataSource);
  @override
  Future<UserModel?> getUser(String userId)async {
    return await firebaseDataSource.getUser(userId);
  }

  @override
  Future<User?> registerUser(String email, String password, UserEntity userEntity) async {
    UserModel userModel=UserModel(
        id: "", name: userEntity.name, email: email, phone: userEntity.phone, profileImage: userEntity.profileImage);
  return await firebaseDataSource.registerUser(email, password, userModel);
  }

  @override
  Future<User?> signInUser(String email, String password) async{
  return await firebaseDataSource.signInUser(email, password);
   }
  
}