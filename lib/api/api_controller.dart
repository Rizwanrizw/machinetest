import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
class ApiController{
 final String url= "https://rubidya.com/api/users/get-media";
 final String token= "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjBiZmUxODE3ZmYzZjBkMmZjMmQwNGUiLCJpYXQiOjE3MTQ3MTkyMDMsImV4cCI6MTc4MzgzOTIwM30.HfsYDcVEzMsdi6pU24IzHzmGAxfDQ2NAJYIptOAu_9I";

 Future<Map<String, dynamic>> fetchData() async {
   final response = await http.get(
     Uri.parse(url),
     headers: {
       'Authorization': 'Bearer $token',
     },
   );

   if (response.statusCode == 200) {
     log("get");
     final Map<String, dynamic> responseData = json.decode(response.body);
     return responseData;
   } else {
     throw Exception('Failed to fetch data: ${response.reasonPhrase}');
   }
 }
}
