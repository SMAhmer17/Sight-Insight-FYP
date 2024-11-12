import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeinsider/domain/user_details/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.imageUrlPath,
    required super.name,
    required super.gender,
    required super.age,
    required super.dob,
    required super.previousEyeDisease,
    required super.country,
    required super.city,
    required super.phoneNumber,
    required super.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'imageUrlPath': imageUrlPath ?? 'Null',
      'name': name,
      'gender': gender,
      'age': age,
      'dob': dob,
      'previousEyeDisease': previousEyeDisease,
      'country': country,
      'city': city,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }

  @override
  String toString() {
    return 'UserModel(imageUrlPath: $imageUrlPath, name: $name, gender: $gender, age: $age, dob: $dob, previousEyeDisease: $previousEyeDisease, country: $country, city: $city, phonenNumber: $phoneNumber, email: $email)';
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      imageUrlPath: map['imageUrlPath'] as String?,
      name: map['name'] as String,
      gender: map['gender'] as String,
      age: map['age'] as int,
      dob: (map['dob'] as Timestamp).toDate(),
      previousEyeDisease: map['previousEyeDisease'] as bool,
      country: map['country'] as String,
      city: map['city'] as String,
      phoneNumber: map['phoneNumber'] as int,
      email: map['email'] as String,
    );
  }

   UserModel copyWith({
    String? imageUrlPath,
    String? name,
    int? age,
    DateTime? dob,
    bool? previousEyeDisease,
    String? country,
    String? city,
    int? phoneNumber,
    String? email,
  }) {
    return UserModel(
      imageUrlPath: imageUrlPath  ?? this.imageUrlPath,
        name: name ?? this.name,
        gender: gender,
        age: age ?? this.age,
        dob: dob ?? this.dob,
        previousEyeDisease: previousEyeDisease ?? this.previousEyeDisease,
        country: country ?? this.country,
        city: city ?? this.city,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email);
  }
}
