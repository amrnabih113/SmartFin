import 'package:smartFin/features/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uid,
    required super.fName,
    required super.lName,
    required super.userName,
    required super.email,
    required super.phoneNumber,
    required super.imageurl,
  });

  /// Convert `UserModel` to `UserEntity`
  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      fName: fName,
      lName: lName,
      userName: userName,
      email: email,
      phoneNumber: phoneNumber,
      imageurl: imageurl,
    );
  }

  /// Create `UserModel` from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['id'] ?? '',
        email: json['email'] ?? '',
        fName: json['f_name'] ?? '',
        lName: json['l_name'] ?? '',
        userName: json['username'] ?? '',
        phoneNumber: json['phone_number'] ?? '',
        imageurl: json['imageUrl'] ?? '',
      );

  /// Convert `UserModel` to JSON
  Map<String, dynamic> toJson() => {
        'id': uid,
        'email': email,
        'f_name': fName,
        'l_name': lName,
        'username': userName,
        'phone_number': phoneNumber,
        'imageUrl': imageurl,
      };

  /// Empty instance for default values
  static UserModel empty() => UserModel(
        uid: '',
        email: '',
        fName: '',
        lName: '',
        userName: '',
        phoneNumber: '',
        imageurl: '',
      );
}
