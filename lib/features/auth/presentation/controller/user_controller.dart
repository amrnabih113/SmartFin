

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smartFin/core/utils/popups/loaders.dart';
import 'package:smartFin/features/auth/data/models/user_model.dart';
import 'package:smartFin/features/auth/data/service/local/sqflite_auth.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<bool> profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final SqfliteAuth sqfliteAuth;

  UserController({required this.sqfliteAuth});


  Rx<bool> imageLoading = false.obs;

  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  Future<void> saveUserRecord(UserCredential? user) async {
    try {
      if (user != null) {
        final nameParts = UserModel.nameParts(user.user!.displayName!);
        final username = UserModel.generateUsername(user.user!.displayName!);
        final userModel = UserModel(
          firebaseId: user.user!.uid,
          uid: user.user!.uid,
          email: user.user!.email!,
          fName: nameParts[0],
          lName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : "",
          userName: username,
          phoneNumber: user.user!.phoneNumber ?? "",
          imageurl: "",
        );

        await sqfliteAuth.saveUser(userModel);
      }
    } catch (e) {
      MyLoaders.errorSnackBar(
          title: "Data not saved",
          message:
              "An error occurred while saving user data. Please try again later.");
    }
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading(true);
      final user = await sqfliteAuth.getUser();
      this.user(user);
      profileLoading(false);
    } catch (e) {
      user(UserModel.empty());
    }
  }

}
