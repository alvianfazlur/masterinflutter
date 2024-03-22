import 'package:bwa_masteringflutter/models/destination.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPageController extends GetxController{
  late final DestinationModel destination;
  late final RxInt traveller;
  late final Rx<DateTime> selectedDate;
  late final int price;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    destination = arguments['destination'];
    traveller = arguments['traveller'];
    selectedDate = arguments['date'];
    price = traveller.value * destination.price;
  }

  Future<void> launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}