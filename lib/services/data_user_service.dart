import 'dart:convert';
import 'package:http/http.dart' as http;
import '../shared/api_url.dart';

class DataUserService{

  Future<void> storeUser(String name, String id, int balance, String hobby, String email) async {
    try{
      var requestData = {
        'uid': id,
        'name': name,
        'balance': balance,
        'hobby': hobby,
        'email' : email
      };

      var response = await http.post(
        Uri.parse(storeUserApi),
        body: jsonEncode(requestData),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.statusCode);
    }catch(error){
      throw error;
    }

  }
}