import 'dart:convert';

import 'package:cat_facts/constants/app_constants.dart';
import 'package:cat_facts/controllers/translate_text_controller.dart';
import 'package:cat_facts/models/cat_fact.dart';
import 'package:http/http.dart' as http;

class CatFactController {
  static final CatFactController instance = CatFactController._();
  CatFactController._();

  Future<String> getFact() async {
    http.Response response = await http.get(
        Uri.parse('${appConstants['baseApiUrl']}/fact'),
        headers: <String, String>{'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      String fact = jsonDecode(response.body)['fact'];

      fact = await TranslateTextController.instance
          .translateTextToPortuguese(fact);

      return fact;
    }

    return "";
  }
}
