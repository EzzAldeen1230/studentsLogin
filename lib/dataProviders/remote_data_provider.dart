import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import './error/exceptions.dart';
import './network/data_source_url.dart';

class RemoteDataProvider {
  final http.Client client;

  RemoteDataProvider({required this.client});

  Future<dynamic> sendData({required String url,required Map<String, dynamic> body,
    required retrievedDataType,dynamic returnType,}) async {

    log('send data lunched ');

    log('body is '+ body.toString());
    log("I am here " + url);

    final response = await client.post(
      Uri.parse(DataSourceURL.baseUrl + url),
// body: body,
      headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json', 'Authorization': 'Bearer ${body["api_token"] ?? ""}'},
    );

    log(DataSourceURL.baseUrl + url);
    log("response.body " + response.body.toString());
    log(response.statusCode.toString());
    // log("returnType "+returnType.toString());

    if (response.statusCode == 200) {
      log('the status code is 200');
      if (returnType == List) {
        final List<dynamic> data = json.decode(response.body);
        log('the data data type is List');
        log("the data from return type is ${retrievedDataType.fromJsonList(data)}");

        return retrievedDataType.fromJsonList(data);
      } else if (returnType == int) {
        final dynamic data = response.body;
        return data;
      } else if (returnType == String) {
        print('the data is string ');
        final dynamic data = json.decode(response.body);
        return data;
      } else {
        final dynamic data = json.decode(response.body);
        log('remote data provider is $data');

        if (data is List) {
          if (data.isEmpty) {
            log('data exception');
            throw EmptyException();
          }else{
            print('data is not empty');
          }
        }

        print('data is $data');
        return retrievedDataType.fromJson(data);
      }
    }

    else if (response.statusCode == 201) {
      return 1;
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else if (response.statusCode == 406) {
      throw InvalidException();
    } else if (response.statusCode == 410) {
      throw ExpireException();
    } else if (response.statusCode == 430) {
      throw UniqueException();
    } else if (response.statusCode == 434) {
      throw UserExistsException();
    } else if (response.statusCode == 439) {
      throw BlockedException();
    } else if (response.statusCode == 433) {
      throw ReceiveException();
    }else if (response.statusCode == 500) {
      throw ServerException();
    }else if (response.statusCode == 422) {
      throw ResponseException();
    }
  }
}
