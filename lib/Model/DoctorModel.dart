import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorModel{

  String id , name , profile  , speciality  , description , availibility , location  ;
  var  rating ,sessionFees;


/*  DoctorModel.fromMap(Map<String,dynamic> map,String key)
      : id=key,
        name = map['name'],
        profile = map['profile'],
        speciality = map['speciality'],
        sessionFees = map['sessionFees'],
        availibility = map['availibility'],
        location = map['location'],
        rating = map['rating'],
        description = map['description'];*/


  DoctorModel(
      this.id,
      this.name,
      this.profile,
      this.speciality,
      this.sessionFees,
      this.description,
      this.availibility,
      this.location,
      this.rating);

/*  DoctorModel.fromSnapshot(DocumentSnapshot snapshot )
      : this.fromMap(snapshot.data() as Map<String, dynamic>,snapshot.reference.id);*/
}
