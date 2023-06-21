import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gitbee/models/show_account_info.dart';
import 'package:gitbee/models/show_repositories.dart';

class Services {
  static Future<BaseOptions> getBasseOptions() async {
    BaseOptions options = BaseOptions(
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );

    return options;
  }

  Future<ShowAccountInfo> show_account_info({required String username}) async {
    var response;
    var _dio = Dio(
      await getBasseOptions(),
    );
    String url = 'https://api.github.com/users/${username}';
    try {
      response = await _dio.get(url);
      if (response.statusCode == 200) {
        return ShowAccountInfo.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return ShowAccountInfo.fromJson(response.data);
  }

  Future<List<RepositoryModel>> show_repositories(
      {required String username}) async {
    var response;
    List<RepositoryModel> data = [];
    var _dio = Dio(
      await getBasseOptions(),
    );
    String url = 'https://api.github.com/users/${username}/repos';
    try {
      response = await _dio.get(url);
      if (response.statusCode == 200) {
        final allData = response.data
            .map((json) =>
                RepositoryModel.fromJson(json as Map<String, dynamic>))
            .toList()
            .cast<RepositoryModel>() as List<RepositoryModel>;
        print(allData.length);
        data.addAll(allData);
        return data;
      }
    } catch (e) {
      print(e);
    }
    return data;
  }
}
