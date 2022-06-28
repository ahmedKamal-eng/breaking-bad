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
  //
  // Future<List<dynamic>> getAllCharacters() async{
  //
  //   dio.get('characters').then((value) {
  //    Response  response=value;
  //     print(response.data.toString());
  //     return response.data;
  //   }).catchError((e){
  //     print(e.toString());
  //   });
  //
  // }


  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      print(response.data.toString());
      print('hello');
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }  }

}