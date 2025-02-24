import 'package:smartFin/core/utils/formatters/formatters.dart';
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
    required this.firebaseId,
  });

  final String firebaseId;

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
        imageurl: json['image_url'] ?? '',
        firebaseId: json['firebase_id'] ?? '',
      );

  /// Convert `UserModel` to JSON
  Map<String, dynamic> toJson() => {
        'id': uid,
        'email': email,
        'f_name': fName,
        'l_name': lName,
        'username': userName,
        'phone_number': phoneNumber,
        'image_url': imageurl,
        'firebase_id': firebaseId,
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
        firebaseId: '',
      );

  String get fullName => '$fName $lName';

  String get formatPhoneNumber => MyFormatters.formatphoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(' ');

  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }
}

