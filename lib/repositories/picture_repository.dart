import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import '../models/picture.dart' show Picture;

class PictureRepository {
  Future<List<Picture>> fetchImages(int amount) async {
    final List<Picture> pictures = <Picture>[];
    while (pictures.length < amount) {
      final Map<String, dynamic> response = await fetchImageUrl();
      pictures.add(Picture.fromJson(response));
    }
    return pictures;
  }

  Future<Map<String, dynamic>> fetchImageUrl() async {
    try {
      final http.Client client = http.Client();
      final http.Response response = await client.get(
          'http://www.splashbase.co/api/v1/images/1');
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
