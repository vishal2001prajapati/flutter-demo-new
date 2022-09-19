import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'UserListGetMethod.dart';

part 'api_client.g.dart';

// Step-1
@RestApi(baseUrl: "https://reqres.in/")
// Step-2
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/api/users?page=2")
  Future<UserListGetMethod> getUsers();
}
