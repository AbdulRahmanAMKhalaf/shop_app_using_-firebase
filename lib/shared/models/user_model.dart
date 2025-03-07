class UserModel {
  final String name;
  final String phoneNumber;
  final String email;
  final String id;

  UserModel(
      {required this.name,
      required this.phoneNumber,
      required this.email,
      required this.id});

  factory UserModel.fromFireStore(Map<String, dynamic> data) {
    return UserModel(
        name: data['fullName'],
        phoneNumber: data['phoneNumber'],
        email: data['email'],
        id: data['id']);
  }
}
