import "dart:convert";
import "dart:html";

import "package:dio/dio.dart";
import "package:flutter/material.dart";

class HttpClient {
  final dio = Dio();

  Future<dynamic> fetch(String url, { Map<String, dynamic>? query, Object? data }) async {
    var response = await dio.get(url, data: data, queryParameters: query);

    // print([response, response.statusCode]);

    if (response.statusCode != 200) throw ErrorDescription(response.statusMessage ?? 'Unexpected Error');

    // return jsonDecode(response.data);
    return response.data;
  }
}

var client = HttpClient();
