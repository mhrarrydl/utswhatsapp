import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_clone/data/models/user_model.dart';

class FirebaseDataSource{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

      Future<User?> registerUser(String email ,String password ,UserModel userModel) async{
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    await _firestore.collection('users').doc(userCredential.user!.uid).set(userModel.toJson());
    return userCredential.user;
      }

     Future<User?> signInUser(String email ,String password)async{
        UserCredential userCredential= await _auth.signInWithEmailAndPassword(email: email, password: password);
        return userCredential.user;
       }
        Future<UserModel?> getUser(String userId)async{
         DocumentSnapshot doc = await _firestore.collection('users').doc(userId).get();
         if(doc.exists){
           return UserModel.fromJson(doc.data() as Map<String,dynamic>);
         }
         return null ;
            }
}