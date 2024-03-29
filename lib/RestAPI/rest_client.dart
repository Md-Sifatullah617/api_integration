import 'dart:convert';
import 'package:api_integraton/Style/style.dart';
import 'package:http/http.dart' as http;

Future<bool> productCreateRequest(formValues) async {
  var uRL = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var postBody = json.encode(formValues);
  var postHeader = {"Content-Type": "application/json"};

  var response = await http.post(uRL, headers: postHeader, body: postBody);

  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody["status"] == "success") {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request Fail ! try again");
    return false;
  }
}

Future<bool> productUpdateRequest(formValues, id) async {
  var uRL = Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/"+id);
  var postBody = json.encode(formValues);
  var postHeader = {"Content-Type": "application/json"};

  var response = await http.post(uRL, headers: postHeader, body: postBody);

  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody["status"] == "success") {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request Fail ! try again");
    return false;
  }
}

Future<List> productGVLRequest() async {
  var uRL = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
  var postHeader = {"Content-Type": "application/json"};
  var response = await http.get(uRL, headers: postHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode == 200 && resultBody["status"] == "success") {
    successToast("Request Success");
    return resultBody["data"];
  } else {
    errorToast("Request Fail! try again");
    return [];
  }
}

Future<bool> productDeleteRequest(id) async {
  var uRL = Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/" + id);
  var postHeader = {"Content-Type": "application/json"};
  var response = await http.get(uRL, headers: postHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody["status"] == "success") {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request fail ! try again");
    return false;
  }
}
