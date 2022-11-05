import 'dart:convert';
import 'dart:math';

import 'package:ecommerce/models/homepagemodel.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/models/mymodels.dart';
import 'package:ecommerce/models/postProductdetailpage.dart';
import 'package:ecommerce/webservices/postdatatodetailpage.dart';
import 'package:http/http.dart' as http;

Map? respons;

Future<Object?> GeTApi() async {
  var result = await http.get(Uri.parse(
      "https://web.stellarinfosys.com/choicemaker/app_apis/get_home_page_data.php"));
  respons = jsonDecode(result.body);

  return respons;
}

class HttpService {
  static Future getHomePage() async {
    var response = await http.get(Uri.parse(
        "https://web.stellarinfosys.com/choicemaker/app_apis/get_home_page_data.php"));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;
    } else {
      throw Exception();
    }
  }

  static Future getProductDetails(id) async {
    final http.Response response = await http.post(
      Uri.parse(
          'https://web.stellarinfosys.com/choicemaker/app_apis/getProductDetails.php'),
      body: {
        'product_id': id.toString(),
      },
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;
    } else {
      throw Exception();
    }
  }

  static Future getCategoryProduct(id) async {
    final http.Response response = await http.post(
      Uri.parse(
          'https://web.stellarinfosys.com/choicemaker/app_apis/get_subcat_products.php'),
      body: {
        'category_id': id.toString(),
      },
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;
    } else {
      throw Exception();
    }
  }
}
