import 'package:breaking_bad_app/constant/strings.dart';
import 'package:dio/dio.dart';

class CharactersWebServices{
  late Dio dio;

  CharactersWebServices()
  {
    BaseOptions baseOptions=BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: 30 * 1000,
      connectTimeout: 20 * 1000,
    );
    dio= Dio(baseOptions);
  }
  
  Future<List<dynamic>?> getAllCharacters() async{

   late Response response;

    dio.get('characters').then((value) {
      response=value;
      print(response.data.toString());
      return response.data;
    }).catchError((e){
      print(e.toString());
    });

  }
  
}