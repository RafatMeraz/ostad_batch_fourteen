// "_id": "69e4c459360da9d1207182ea",
// "first_name": "Meskatul",
// "last_name": "Islam",
// "email": "meskatcse@gmail.com",
// "email_verified": true,
// "phone": "01754658781",
// "phone_verified": false,
// "avatar_url": null,
// "city": "Chattogram",
// "role": 0

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String city;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      city: jsonData['city'],
      email: jsonData['email'],
      firstName: jsonData['first_name'],
      lastName: jsonData['last_name'],
      id: jsonData['_id'],
    );
  }
}
