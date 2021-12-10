import 'package:http/http.dart' as http;

class ApiService {
  static const String link = 'http://abdoallamostafa-001-site2.ftempurl.com/api/switch/change';

  Future<String> sendBoolean(int startOp) async {
    final response = await http.get(link + '?id=$startOp');
    return response.body;
  }
}