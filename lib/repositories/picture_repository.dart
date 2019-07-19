import 'dart:async' show Future;
import 'dart:convert' show json;
import 'dart:math' show Random;
import 'package:http/http.dart' as http;
import '../models/picture.dart' show Picture;

class PictureRepository {
  Future<Picture> fetchImage() async {
    final String response = await fetchImageUrl();
    return Picture(path: response);
  }

  Future<String> fetchImageUrl() async {
    try {
      final http.Client client = http.Client();
      final String downloadUrl =
          'https://picsum.photos/25?image=${Random().nextInt(10)}';
      final http.Response response = await client.get(downloadUrl);
      if (response.statusCode == 200) {
        return downloadUrl;
      } else {
        throw Exception('Failed to load picture');
      }
    } catch (error) {
      throw await error;
    }
  }
}
