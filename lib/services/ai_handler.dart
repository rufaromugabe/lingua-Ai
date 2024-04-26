import 'package:http/http.dart' as http;
import 'dart:convert';

class AIHandler {
  final String _baseUrl = 'http://127.0.0.1:8000';

  Future<String> getResponse(String message) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8000/message/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'text': message,
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data['message'];
      } else {
        return 'Something went wrong';
      }
    } catch (e) {
      return 'Bad response';
    }
  }
}
