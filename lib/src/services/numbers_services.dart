import 'package:http/http.dart' as http;

class Services {
  Future<String> getNumberInformation(String number) async {
    final String _Api = 'http://numbersapi.com/$number';
    http.Response getData = await http.get(Uri.parse(_Api));

    return getData.body;
  }
}
