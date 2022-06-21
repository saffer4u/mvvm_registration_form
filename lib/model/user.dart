import 'dart:convert';


class User {
  final String firstName;
  final String lastName;
  final String phoneNo;
  final String email;
  final String gender;
  final String password;
  final String qualification;
  final String passingYear;
  final String grade;
  final String yearsOfExperience;
  final String designation;
  final String domain;
  final String address;
  final String landmark;
  final String city;
  final String state;
  final String pinCode;
  User({
    required this.firstName,
    required this.lastName,
    required this.phoneNo,
    required this.email,
    required this.gender,
    required this.password,
    required this.qualification,
    required this.passingYear,
    required this.grade,
    required this.yearsOfExperience,
    required this.designation,
    required this.domain,
    required this.address,
    required this.landmark,
    required this.city,
    required this.state,
    required this.pinCode,
  });

  User copyWith({
    String? firstName,
    String? lastName,
    String? phoneNo,
    String? email,
    String? gender,
    String? password,
    String? qualification,
    String? passingYear,
    String? grade,
    String? yearsOfExperience,
    String? designation,
    String? domain,
    String? address,
    String? landmark,
    String? city,
    String? state,
    String? pinCode,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNo: phoneNo ?? this.phoneNo,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      password: password ?? this.password,
      qualification: qualification ?? this.qualification,
      passingYear: passingYear ?? this.passingYear,
      grade: grade ?? this.grade,
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
      designation: designation ?? this.designation,
      domain: domain ?? this.domain,
      address: address ?? this.address,
      landmark: landmark ?? this.landmark,
      city: city ?? this.city,
      state: state ?? this.state,
      pinCode: pinCode ?? this.pinCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'phoneNo': phoneNo,
      'email': email,
      'gender': gender,
      'password': password,
      'qualification': qualification,
      'passingYear': passingYear,
      'grade': grade,
      'yearsOfExperience': yearsOfExperience,
      'designation': designation,
      'domain': domain,
      'address': address,
      'landmark': landmark,
      'city': city,
      'state': state,
      'pinCode': pinCode,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      phoneNo: map['phoneNo'] as String,
      email: map['email'] as String,
      gender: map['gender'] as String,
      password: map['password'] as String,
      qualification: map['qualification'] as String,
      passingYear: map['passingYear'] as String,
      grade: map['grade'] as String,
      yearsOfExperience: map['yearsOfExperience'] as String,
      designation: map['designation'] as String,
      domain: map['domain'] as String,
      address: map['address'] as String,
      landmark: map['landmark'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      pinCode: map['pinCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(firstName: $firstName, lastName: $lastName, phoneNo: $phoneNo, email: $email, gender: $gender, password: $password, qualification: $qualification, passingYear: $passingYear, grade: $grade, yearsOfExperience: $yearsOfExperience, designation: $designation, domain: $domain, address: $address, landmark: $landmark, city: $city, state: $state, pinCode: $pinCode)';
  }
}
