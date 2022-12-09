import '../Screens/Authentication/signin_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginAuthRepository {
  login(String email, String password) async {
    Map mapdata = {
      'email': emailcontroller,
      'password': passwordcontroller,
    };
    http.Response response = await http.post(Uri.parse(''));
  }
}
