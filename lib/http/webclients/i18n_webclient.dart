import 'dart:convert';

import 'package:bytebank/http/webclient.dart';
import 'package:http/http.dart';

class I18NWebClient {
  static const String MESSAGES_URI =
      'https://gist.githubusercontent.com/kakobotasso/6b475230c375b0b64d42a84c8f53ee68/raw/78d13742289a1bb6ca23edd78b023767c7631aad';

  String _viewKey;

  I18NWebClient(this._viewKey);

  Future<Map<String, dynamic>> findAll() async {
    final Response response =
    await client.get("$MESSAGES_URI/$_viewKey.json");
    final Map<String, dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson;
  }
}
