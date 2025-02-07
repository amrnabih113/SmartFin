import 'package:smartFin/features/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {
      required super.email, 
      required super.uid,
      required super.fName,
      required super.lName,
      required super.userName,
      required super.phoneNumber,
      required super.imageurl});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['id'] ?? '',
        email: json['email'] ?? '',
        fName: json['f_name'] ?? '',
        lName: json['l_name'] ?? '',
        userName: json['username'] ?? '',
        phoneNumber: json['phone_number'] ?? '',
        imageurl: json['imageUrl'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': uid,
        'email': email,
        'f_name': fName,
        'l_name': lName,
        'username': userName,
        'phone_number': phoneNumber,
        'imageUrl': imageurl,
      };
}

