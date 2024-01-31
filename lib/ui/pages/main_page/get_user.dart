import 'package:bwa_masteringflutter/models/user.dart';
import 'package:bwa_masteringflutter/services/user_service.dart';
import 'package:get/get.dart';

class GetUser extends GetxController{
  late userData user;

  Future<userData> getCurrentUser(String id) async {
    try{
      user = await userService().getUserById(id);
      return user;
    }catch(e){
      throw e;
    }
  }
}