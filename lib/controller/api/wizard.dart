import 'dart:convert';
import 'package:http/http.dart' as http;

const mainUrl = 'https://wizard-world-api.herokuapp.com/';
class WizardApi {
  Future<dynamic> fetchData(String value) async {
    final url = Uri.parse(mainUrl + value);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);

        return body;
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
    return null;
  }
}
