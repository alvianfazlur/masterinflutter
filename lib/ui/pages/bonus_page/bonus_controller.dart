import 'package:bwa_masteringflutter/models/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../shared/api_url.dart';

class BonusPageController extends GetxController {
  late final userData user;
  int? balance;

  @override
  void onInit() {
    user = Get.arguments as userData;
    fetchBalance(user.id);
    user.balance = balance!;
    super.onInit();
  }

  Future<void> fetchBalance(String uid) async {
    final String url = '$getUserBalance$uid';
    final response = await http.get(Uri.parse(url));
    String responseBody = response.body;
    responseBody = responseBody.replaceAll('[', '').replaceAll(']', '');
    balance = int.tryParse(responseBody);
  }

}
