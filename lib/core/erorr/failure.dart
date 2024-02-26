import 'package:meet_app/core/erorr/erorrModel.dart/erorrModel.dart';

abstract class Faliure {
  final String erorrMessage;

  Faliure(this.erorrMessage);
}

class ServerFaliure extends Faliure {
  ServerFaliure(super.erorrMessage);
  factory ServerFaliure.fromDioErorr(ErorrModel erorrCode) {
    return ServerFaliure.fromResponse(
        erorrCode.response!.statusCode!, erorrCode.response);
  }
  factory ServerFaliure.fromResponse(int stutusCode, dynamic response) {
    if (stutusCode == 400 || stutusCode == 401 || stutusCode == 403) {
      return ServerFaliure(response['error']['message']);
    } else if (stutusCode == 404) {
      return ServerFaliure("Your Request Not Found, Please try later!");
    } else if (stutusCode == 500) {
      return ServerFaliure("Internal Server Erorr, Please try later!");
    } else {
      return ServerFaliure("Opps There Was am Erorr");
    }
  }
}
