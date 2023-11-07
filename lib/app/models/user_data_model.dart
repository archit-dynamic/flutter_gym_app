import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? birthDate;
  final String? gender;

  UserData({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.gender,
  });

  factory UserData.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return UserData(
      id: data?['id'],
      email: data?['email'],
      firstName: data?['firstName'],
      lastName: data?['lastName'],
      birthDate: data?['birthDate'],
      gender: data?['gender'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (email != null) "email": email,
      if (firstName != null) "firstName": firstName,
      if (lastName != null) "lastName": lastName,
      if (birthDate != null) "birthDate": birthDate,
      if (gender != null) "gender": gender,
    };
  }
}
