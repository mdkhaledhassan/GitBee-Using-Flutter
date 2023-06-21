import 'package:get/get.dart';
import 'package:gitbee/api_services.dart';
import 'package:gitbee/models/show_account_info.dart';

class ShowAccountInfoController extends GetxController {
  ShowAccountInfo? showAccountInfo;
  RxList<ShowAccountInfo> showAccountInfoMap = <ShowAccountInfo>[].obs;

  final Services repository = new Services();

  ShowAccountInfoServiceProvider({required String username}) async {
    showAccountInfo = await repository.show_account_info(username: username);

    showAccountInfoMap.add(showAccountInfo!);
    refresh();
  }
}
