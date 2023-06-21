import 'dart:convert';

import 'package:get/get.dart';
import 'package:gitbee/api_services.dart';
import 'package:gitbee/models/show_repositories.dart';

class ShowRepositoriesController extends GetxController {
  List<RepositoryModel> data = [];
  RxList<List<RepositoryModel>> dataMap = <List<RepositoryModel>>[].obs;

  final Services repository = new Services();

  ShowRepositoriesServiceProvider({required String username}) async {
    data = await repository.show_repositories(username: username);
    print(data.length);
    dataMap.add(data);
    refresh();
    print(data.length);
  }
}
