import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/environment/environment.dart';
import 'package:udemy_flutter_delivery/src/models/user.dart';

class UsersProvider extends GetConnect{

  String url = Environment.API_URL + 'api/users';

  Future<Response> create(User user) async {
      Response response = await post(
          '$url/create',
          user.toJson(),
          headers: {
            'Content-Type':'application/json'
          }
      ); // Esperar hasta que el servidor nos retorne la respuesta

      return response;
  }
}