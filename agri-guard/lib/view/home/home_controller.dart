import 'package:get/get.dart';
import 'package:agri_guard/data/network/firebase/firebase_services.dart';
import 'package:agri_guard/models/scan_model.dart';

class HomeController extends GetxController {
  String? userName;

  List<ScanDetails> scanDetailsList = [];
  @override
  void onInit() {
    super.onInit();
    // Fetch user name and scan details when the widget is initialized
    FirebaseFirestoreService.fetchUserData();
    FirebaseFirestoreService.fetchScanDetails();
  }
}
