import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Model/imageModel.dart';

class Image_api {
  Image_api._();
  static final Image_api image_api = Image_api._();

  Future<List<ImageModel>?> feach_Data(String name) async {
    String uri ="https://pixabay.com/api/?key=35747092-667658513b3b33cbda20ff944&q=$name&image_type=photo";
        // "https://pixabay.com/api/?key=30579047-59d4d724d23235f6f0ffdf3de&q=$name&image_type=photo&pretty=true&per_page=200&orientation=vertical";
    http.Response res = await http.get(Uri.parse(uri));

    if (res.statusCode == 200) {
      Map Json_data = jsonDecode(res.body);
      List list = Json_data['hits'];
      List<ImageModel> Images =
      list.map((e) => ImageModel.fromMap(Data: e)).toList();

      return Images;
    }
    return null;
  }
}
