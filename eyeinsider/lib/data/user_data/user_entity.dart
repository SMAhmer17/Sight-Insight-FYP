

class UserEntity {

  final String? imageUrlPath;
  final String name;
  final String gender;
  final int age;
  final int dob;
  final bool previousEyeDisease;
  final String country;
  final String city;
  final String  phonenNumber;
  final String  email;

  UserEntity({this.imageUrlPath, required this.name,  required this.gender, required this.age, required this.dob, required this.previousEyeDisease, required this.country, required this.city, required this.phonenNumber, required this.email});


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
      'phonenNumber': phonenNumber,
      'email': email,
    };
  }

  @override
  String toString() {
    return 'UserEntity(imageUrlPath: $imageUrlPath, name: $name, gender: $gender, age: $age, dob: $dob, previousEyeDisease: $previousEyeDisease, country: $country, city: $city, phonenNumber: $phonenNumber, email: $email)';
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      imageUrlPath: map['imageUrlPath'] as String?,
      name: map['name'] as String,
      gender: map['gender'] as String,
      age: map['age'] as int,
      dob: map['dob'] as int,
      previousEyeDisease: map['previousEyeDisease'] as bool,
      country: map['country'] as String,
      city: map['city'] as String,
      phonenNumber: map['phonenNumber'] as String,
      email: map['email'] as String,
    );
  }
}