import 'package:smartFin/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuth {
  final SupabaseClient supabase;

  SupabaseAuth(this.supabase);

  Future<void> savesUserRecords(UserModel user) async {
    final response = await supabase
        .from("users")
        .select()
        .eq("firebase_id", user.uid)
        .limit(1);
    if (response.isNotEmpty) {
    } else {
      await supabase.from("users").upsert(user.toJson());
    }
  }

  Future<UserModel> fetchUserDetails(String userFirebaseId) async {
    final response = await supabase
          .from("users")
          .select()
          .eq("firebase_id", userFirebaseId)
          .limit(1)
          .single();
      if (response.isNotEmpty) {
        return UserModel.fromJson(response);
      } else {
        return UserModel.empty();
      }
  }

  Future<void> deleteUserRecord(String userId) async {
    await supabase.from("users").delete().eq("firebase_id", userId);
  }
}
