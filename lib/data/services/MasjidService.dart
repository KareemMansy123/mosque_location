import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Mosque.dart';

class MasjidService {
  Future<List<Mosque>> fetchNearbyMosques(double lat, double lng) async {
    var url = Uri.parse('https://masjidnear.me/api/Masjid/SearchMasjids/query/lat\$$lat,lng\$$lng,rad\$3000/');
    var request = http.Request("GET", url);

    var response = await NetworkLogger.logRequest(request);

    if (response.statusCode == 200) {
      return parseMosques(response.body);
    } else {
      throw Exception('Failed to load mosques');
    }
  }

  List<Mosque> parseMosques(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Mosque>((json) => Mosque.fromJson(json)).toList();
  }
}
class NetworkLogger {
  static Future<http.Response> logRequest(http.Request request) async {
    print("Request URL: ${request.url}");
    print("Request Method: ${request.method}");
    print("Request Headers: ${request.headers}");
    if (request.body.isNotEmpty) {
      print("Request Body: ${request.body}");
    }

    http.StreamedResponse streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    return response;
  }
}