import 'package:translator/translator.dart';

class TranslateTextController {
  static final TranslateTextController instance = TranslateTextController._();
  TranslateTextController._();

  Future<String> translateTextToPortuguese(String text) async {
    final translator = GoogleTranslator();

    var translation = await translator.translate(text, to: 'pt');

    return translation.text;
  }
}
