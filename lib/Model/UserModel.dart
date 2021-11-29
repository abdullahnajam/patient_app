import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{

  String id , fullName ,email  , phoneNo ,  type , gender ;

  UserModel.fromMap(Map<String,dynamic> map,String key)
      : id=key,
        fullName = map['fullName'],
        email = map['email'],
        phoneNo = map['phoneNo'],
        gender = map['gender'],
        type = map['type'];



      UserModel(this.id, this.fullName, this.email, this.phoneNo,this.gender,
      this.type);

  UserModel.fromSnapshot(DocumentSnapshot snapshot )
      : this.fromMap(snapshot.data() as Map<String, dynamic>,snapshot.reference.id);
}
