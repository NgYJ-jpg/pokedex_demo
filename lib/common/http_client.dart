import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

abstract class BaseHttpClient {
  late final Dio client;
  late final BaseOptions options;

  void _configureOptions();

  void _onRequest(RequestOptions options, RequestInterceptorHandler handler);

  void _onResponse(Response<dynamic> e, ResponseInterceptorHandler handler);

  void _onError(DioError e, ErrorInterceptorHandler handler);

  BaseHttpClient() {
    _configureOptions();
    client = Dio(options);
    client.interceptors.add(
      InterceptorsWrapper(
        onRequest:(options, handler) {
          _onRequest(options, handler);
        },
        onResponse: (e, handler) {
          _onResponse(e, handler);
        },
        onError: (e, handler) {
          log('Error $e', time: DateTime.now());
          _onError(e, handler);
        },
      )
    );
  }
  
  BaseHttpClient.fromClient(this.client);

  Future<dynamic> get(String url, { Map<String, dynamic>? query }) async {
    Response<dynamic> response;
    try {
      response = await client.get(url, queryParameters: query);
    } on DioError {
      print('error');
      return {'results': [{'name': 'undefined', 'url': '1/1/100/'}]};
    } 

    print('no error');

    return response.data;
  }

  Future<dynamic> post(String url, { Map<String, dynamic>? query, Object? body }) async {
    var response = await client.post(url, queryParameters: query, data: body);

    return response.data;
  }
}

class HttpClient extends BaseHttpClient {
  HttpClient();

  HttpClient.fromClient(Dio client) : super.fromClient(client);

  @override
  void _configureOptions() {
    super.options = BaseOptions(
      headers: {'foo': 'bar', 'fizz': 'buzz'},
      responseType: ResponseType.json
    );
  }

  @override
  void _onError(DioError e, ErrorInterceptorHandler handler) {
    // TODO: implement _onError
    handler.next(e);

    // var custom = {'results': [{'name': 'undefined', 'url': '1/1/100/'}]};

    // handler.resolve(Response(data: custom, requestOptions: e.requestOptions));
  }

  @override
  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement _onRequest
    options.headers.addAll({ 'token': 'salt+${DateTime.now()}' });

    handler.next(options);
  }

  @override
  void _onResponse(Response e, ResponseInterceptorHandler handler) {
    // TODO: implement _onResponse
    handler.next(e);
  }
}

var client = HttpClient();
