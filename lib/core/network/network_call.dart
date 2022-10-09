import 'package:bansi_expense_tracker/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'network_call.g.dart';




@RestApi(baseUrl: baseUrl)
@singleton
abstract class RestClient {
  @factoryMethod
  factory RestClient(Dio dio) = _RestClient;

  @GET("/todos")
  Future<dynamic> getTodos();
}
