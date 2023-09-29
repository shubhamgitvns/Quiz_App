import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Utilities {
  //<<<<<<<<<<<<<< Create Quiz Path >>>>>>>>>>>>>>>>>>//
  static String pythonpath="/json/quiz.json";
  static String cpath="/json/c.json";
  static String currentpath="";

  //<<<<<<<<<<<<<< Create Quiz App_Bar Title  >>>>>>>>>>>>>>>>>>//
  static String quiztitle="";
  static Future downloadQuestions(String link) async {
    String base = "directsell.biz";
    final url = Uri.http(base, link, {});
    print("URL$link");

    try {
      final response = await http.get(url);
      // print("Response $response");
      // print("Status ${response.statusCode}");
      // print("Body ${response.body}");
      final jsonResponse = convert.jsonDecode(response.body);
      //print(jsonResponse);
      return jsonResponse;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
