import 'dart:async' show Future;
import 'dart:convert' show json;
import 'dart:math' show Random;
import 'package:http/http.dart' as http;
import '../models/picture.dart' show Picture;

class PictureRepository {
  Future<Picture> fetchImage() async {
    final Map<String, dynamic> response = await fetchImageUrl();
    return Picture.fromJson(response);
  }

  Future<Map<String, dynamic>> fetchImageUrl() async {
    try {
      final http.Client client = http.Client();
      final http.Response response = await client.get(
          'http://www.splashbase.co/api/v1/images/${Random().nextInt(10)}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = await json.decode(
            response.body);
        return jsonResponse;
      } else {
        throw Exception('Failed to load picture');
      }
    } catch (error) {
      throw await error;
    }
  }
}
