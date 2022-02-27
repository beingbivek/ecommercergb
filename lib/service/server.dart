import 'package:ecommercergb/constants/constant.dart';
import 'package:ecommercergb/modals/userdata.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future postUser(String url, {Map? body}) async {
  print(body.toString());
  try {
    return http.post(Uri.parse(url), body: body).then(
      (http.Response response) {
        final int statusCode = response.statusCode;
        print(response.body);
        print(json.encode(response.body));
        if (statusCode != kStatusOk) {
          throw Exception("Error while fetching data");
        }
        return UserData.fromJson(json.decode(response.body));
      },
    );
  } catch (e) {
    print(e.toString());
  }
}
