class UserModel {
  final String name;
  final String phoneNumber;
  final String email;
  final String id;
  final String work;

  UserModel(
      {required this.name,
      required this.work,
      required this.phoneNumber,
      required this.email,
      required this.id});

  factory UserModel.fromFireStore(Map<String, dynamic> data) {
    return UserModel(
        name: data['name'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        work: data['work'] ?? '',
        email: data['email'] ?? '',
        id: data['id'] ?? '');
  }
}
