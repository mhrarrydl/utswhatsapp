import 'package:bloc/bloc.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/register_user.dart';
import '../../domain/usecases/sign_in-user.dart';

class UserState{
  final bool isLoading ;
  final String? error;
  final UserEntity? user ;
    UserState({this.isLoading=false,this.error,this.user});
}
class UserEvent{
  final String email;
  final String password;
  final UserEntity? userEntity;
  UserEvent({required this.email,required this.password,this.userEntity});
}
class UserBloc extends Bloc<UserEvent,UserState>{
  final RegisterUser registerUser;
  final SignInUser signInUser ;
  UserBloc({required this.registerUser,required this.signInUser}):super(UserState());

  Stream <UserState> mapEventToState(UserEvent event) async*{
    yield UserState(isLoading: true);
    try{
      if(event.userEntity!=null){
        await registerUser(event.email,event.password,event.userEntity!);
      }else{
        await signInUser(event.email,event.password);
      }
      yield UserState(user: event.userEntity);
    }catch(e){
      yield UserState(error: e.toString());
    }
  }
}