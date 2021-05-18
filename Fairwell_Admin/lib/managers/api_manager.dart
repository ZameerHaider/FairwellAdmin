import 'dart:convert';
import 'dart:io';
import 'package:Fairwell_Admin/utilities/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:connectivity/connectivity.dart';

// import 'HelperFunctions.dart';
class ApiManager {
  String baseurl = APIConstants.baseURLQA;
  String name = "";
  Map<String, dynamic> apiBody;
  Map<String, String> apiHeader;

  ApiManager(String name, Map<String, dynamic> apiBody, bool addToken,
      Map<String, dynamic> header1) {
    this.name = name;
    this.apiBody = apiBody;
    this.apiHeader = header1;

    //this.apiHeader[HttpHeaders.contentTypeHeader] = "application/json";
    this.apiHeader["Accept"] = "application/json";
  }

  Future<Map<String, dynamic>> callPostAPI() async {
    print('In call of Post');
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // Internet is available
      String url123 = this.baseurl + this.name;
      try {
        final responseOfAPI =
            await http.post(url123, body: apiBody, headers: apiHeader);
        print(responseOfAPI.body);
        Map<String, dynamic> fResponse = json.decode(responseOfAPI.body);
        return fResponse;
        //this.delegate.apiCallback(fResponse);

      } catch (error) {
        print(error);
        throw error;
      }
    } else {
      print('error');
      // Internet is not available
      Map<String, dynamic> fResponse = Map<String, dynamic>();
      fResponse['success'] = "fail";
      fResponse['msg'] = "Please check your internet and try again";
      return fResponse;
    }
  }

  Future<Map<String, dynamic>> callGetAPI() async {
    print('In call of Get');

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      String url123 = this.baseurl + this.name;
      print(url123);
      try {
        final responseOfAPI = await http.get(url123,
            //body: apiBody,
            headers: apiHeader);

        print(responseOfAPI.body);
        Map<String, dynamic> fResponse = json.decode(responseOfAPI.body);
        return fResponse;
        //this.delegate.apiCallback(fResponse);
      } catch (error) {
        print(error);
        throw error;
      }
    } else {
      print('error');
      Map<String, dynamic> fResponse = Map<String, dynamic>();
      fResponse['success'] = "fail";
      fResponse['msg'] = "Please check your internet and try again";
      return fResponse;
    }
  }

  ///delete
  Future<Map<String, dynamic>> callDeleteAPI() async {
    print('In call of Delete');

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      String url123 = this.baseurl + this.name;

      print("*********  REQUEST  *********");
      print("Base URL: $url123");
      print("Request: $apiBody");
      print("Headers: $apiHeader");
      print("*********  REQUEST  *********");

      try {
        final responseOfAPI = await http.delete(url123, headers: apiHeader);
        print(responseOfAPI.body);
        Map<String, dynamic> fResponse = json.decode(responseOfAPI.body);

        print("*********  RESPONSE  *********");
        print("Base URL: $url123");
        print("Response: $fResponse");
        print("*********  RESPONSE  *********");

        return fResponse;
      } on FormatException catch (error) {
        print("FormatException: " + error.message);
        throw error;
      } on SocketException catch (error) {
        print("SocketException: " + error.message);
        throw error;
      } on ArgumentError catch (error) {
        print("ArgumentError: " + error.message);
        throw error;
      } catch (error) {
        print(error);
        throw error;
      }
    } else {
      print('error');
      Map<String, dynamic> fResponse = Map<String, dynamic>();
      fResponse['success'] = false;
      fResponse['msg'] = "Please check your internet and try again";
      return fResponse;
    }
  }

  //multipart
  Future<Map<String, dynamic>> callMultipartPostAPI(
      List<CustomMultipartObject> files) async {
    print('In call of Multipart');

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      String url123 = this.baseurl + this.name;
      Uri uri = Uri.parse(url123);

      var request = http.MultipartRequest("POST", uri);
      request.headers.addAll(apiHeader);
      // Map<String,String>accept;
      // accept["Accept"]="*/*";
      // request.headers.(accept);
      request.fields.addAll(apiBody);

      files.forEach((file) {
        var stream =
            new http.ByteStream(DelegatingStream(file.file.openRead()));
        // var length = await file.file.length();

        file.file.length().then((length) {
          var multipartFile = new http.MultipartFile(file.param, stream, length,
              filename: basename(file.file.path));
          request.files.add(multipartFile);
          print("Name: " + multipartFile.field);
          print("Image: " + multipartFile.filename);
          print("Files: " + request.files.length.toString());
        });
      });

      print("*********  REQUEST  *********");
      print("Base URL: $uri");
      print("Request: " + request.fields.toString());
      print("Headers: " + request.headers.toString());
      print("Files: " + request.files.length.toString());
      print("*********  REQUEST  *********");

      try {
        print("Requesting");
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);
        print(streamedResponse);
        print("Code: " + response.statusCode.toString());
        print("Code: " + response.request.toString());

        final prefix = "ï»¿";
        var body = response.body;
        if (body.startsWith(prefix)) {
          body = body.substring(prefix.length);
        }

        print("Responses" + body);
        Map<String, dynamic> fResponse = json.decode(body);

        print("*********  RESPONSE  *********");
        print("Base URL: $uri");
        print("Response: $fResponse");
        print("*********  RESPONSE  *********");

        return fResponse;
      } on FormatException catch (error) {
        print("FormatException: " + error.message);
        throw error;
      } on ArgumentError catch (error) {
        print("ArgumentError: " + error.message);
        throw error;
      } catch (error) {
        print("Exception: " + error);
        throw error;
      }
    } else {
      print('error');
      Map<String, dynamic> fResponse = Map<String, dynamic>();
      fResponse['success'] = false;
      fResponse['msg'] = "Please check your internet and try again";
      return fResponse;
    }
  }

////For Google palce AutoComplete
  Future<Map<String, dynamic>> callGetAddressAPI() async {
    print('In call of Get');

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      String url123 = this.name;
      print(url123);
      try {
        final responseOfAPI = await http.get(url123,
            //body: apiBody,
            headers: apiHeader);

        print(responseOfAPI.body);
        Map<String, dynamic> fResponse = json.decode(responseOfAPI.body);
        return fResponse;
        //this.delegate.apiCallback(fResponse);
      } catch (error) {
        print(error);
        throw error;
      }
    } else {
      print('error');
      Map<String, dynamic> fResponse = Map<String, dynamic>();
      fResponse['success'] = "fail";
      fResponse['msg'] = "Please check your internet and try again";
      return fResponse;
    }
  }
}

class CustomMultipartObject {
  File file;
  String param;

  CustomMultipartObject({this.file, this.param});
}

// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:connectivity/connectivity.dart';
// import 'package:http/http.dart' as http;
// import 'package:path/path.dart';
// import 'package:async/async.dart';
// import 'package:synloox_flutter/utilities/api_constants.dart';

// class ApiManager {
//   String baseurl = APIConstants.baseURL;
//   String name = "";
//   Map<String, dynamic> apiBody;
//   Map<String, String> apiHeader;

//   ApiManager(String name, Map<String, dynamic> apiBody, bool addToken,
//       Map<String, dynamic> header1) {
//     this.name = name;
//     this.apiBody = apiBody;
//     header1['Accept'] = "application/json";
//     this.apiHeader = header1;
//   }

//   Future<Map<String, dynamic>> callPostAPI() async {
//     print('In call of Post');

//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile ||
//         connectivityResult == ConnectivityResult.wifi) {
//       // Internet is available
//       String url123 = this.baseurl + this.name;

//       print("*********  REQUEST  *********");
//       print("Base URL: $url123");
//       print("Request: $apiBody");
//       print("Headers: $apiHeader");
//       print("*********  REQUEST  *********");

//       try {
//         final responseOfAPI = await http
//             .post(url123, body: apiBody, headers: apiHeader)
//             .timeout(Duration(seconds: 60));
//         print(responseOfAPI.body);
//         Map<String, dynamic> fResponse = json.decode(responseOfAPI.body);

//         print("*********  RESPONSE  *********");
//         print("Base URL: $url123");
//         print("Response: $fResponse");
//         print("*********  RESPONSE  *********");

//         return fResponse;
//       } on TimeoutException catch (_) {
//         // A timeout occurred.
//         Map<String, dynamic> fResponse = Map<String, dynamic>();
//         fResponse['status'] = false;
//         fResponse['msg'] = "Connection timeout. Please try again.";
//         return fResponse;
//       } on SocketException catch (_) {
//         // Other exception
//         Map<String, dynamic> fResponse = Map<String, dynamic>();
//         fResponse['status'] = false;
//         fResponse['msg'] = "Something went wrong.";
//         return fResponse;
//       } catch (error) {
//         print(error);
//         throw error;
//       }
//     } else {
//       print('error');
//       // Internet is not available
//       Map<String, dynamic> fResponse = Map<String, dynamic>();
//       fResponse['status'] = false;
//       fResponse['msg'] = "Please check your internet and try again";
//       return fResponse;
//     }
//   }

//   Future<Map<String, dynamic>> callGetAPI() async {
//     print('In call of Get');

//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile ||
//         connectivityResult == ConnectivityResult.wifi) {
//       String url123 = this.baseurl + this.name;

//       print("*********  REQUEST  *********");
//       print("Base URL: $url123");
//       print("Request: $apiBody");
//       print("Headers: $apiHeader");
//       print("*********  REQUEST  *********");

//       try {
//         final responseOfAPI = await http
//             .get(url123, headers: apiHeader)
//             .timeout(Duration(seconds: 60));
//         print(responseOfAPI.body);
//         Map<String, dynamic> fResponse = json.decode(responseOfAPI.body);

//         print("*********  RESPONSE  *********");
//         print("Base URL: $url123");
//         print("Response: $fResponse");
//         print("*********  RESPONSE  *********");

//         return fResponse;
//       } on TimeoutException catch (_) {
//         // A timeout occurred.
//         Map<String, dynamic> fResponse = Map<String, dynamic>();
//         fResponse['status'] = false;
//         fResponse['msg'] = "Connection timeout. Please try again.";
//         return fResponse;
//       } on SocketException catch (_) {
//         // Other exception
//         Map<String, dynamic> fResponse = Map<String, dynamic>();
//         fResponse['status'] = false;
//         fResponse['msg'] = "Something went wrong.";
//         return fResponse;
//       } catch (error) {
//         print(error);
//         throw error;
//       }
//     } else {
//       print('error');
//       Map<String, dynamic> fResponse = Map<String, dynamic>();
//       fResponse['status'] = false;
//       fResponse['msg'] = "Please check your internet and try again";
//       return fResponse;
//     }
//   }

//   Future<Map<String, dynamic>> callMultipartPostAPI(
//       List<CustomMultipartObject> files) async {
//     print('In call of Multipart');

//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile ||
//         connectivityResult == ConnectivityResult.wifi) {
//       String url = this.baseurl + this.name;
//       Uri uri = Uri.parse(url);

//       var request = http.MultipartRequest("POST", uri);
//       apiHeader["Content-Type"] = "multipart/form-data";
//       apiHeader["Accept"] = "application/json";
//       apiHeader["Connection"] = "keep-alive";
//       apiHeader["Accept-Encoding"] = "";

//       request.headers.addAll(apiHeader);
//       request.fields.addAll(apiBody);

//       files.forEach((file) {
//         var stream =
//             new http.ByteStream(DelegatingStream(file.file.openRead()));

//         file.file.length().then((length) {
//           var multipartFile = new http.MultipartFile(file.param, stream, length,
//               filename: basename(file.file.path));
//           request.files.add(multipartFile);
//           print("Name: " + multipartFile.field);
//           print("Image: " + multipartFile.filename);
//           print("Files: " + request.files.length.toString());
//         });
//       });

//       print("*********  REQUEST  *********");
//       print("Base URL: $uri");
//       print("Request: " + request.fields.toString());
//       print("Headers: " + request.headers.toString());
//       print("Files: " + request.files.length.toString());
//       print("*********  REQUEST  *********");

//       try {
//         print("Requesting");
//         var streamedResponse =
//             await request.send().timeout(Duration(seconds: 60));
//         var response = await http.Response.fromStream(streamedResponse);
//         print("Code: " + response.statusCode.toString());
//         print("Code: " + response.request.toString());

//         // if (response.body.isNotEmpty) {
//         //   json.decode(response.body);
//         // }
//         print("Responses" + response.body);
//         Map<String, dynamic> fResponse = json.decode(response.body);

//         print("*********  RESPONSE  *********");
//         print("Base URL: $uri");
//         print("Response: $fResponse");
//         print("*********  RESPONSE  *********");

//         return fResponse;
//       } on TimeoutException catch (_) {
//         // A timeout occurred.
//         Map<String, dynamic> fResponse = Map<String, dynamic>();
//         fResponse['status'] = false;
//         fResponse['msg'] = "Connection timeout. Please try again.";
//         return fResponse;
//       } on FormatException catch (error) {
//         print("FormatException: " + error.message);
//         throw error;
//       } on SocketException catch (_) {
//         Map<String, dynamic> fResponse = Map<String, dynamic>();
//         fResponse['status'] = false;
//         fResponse['msg'] = "Something went wrong.";
//         return fResponse;
//       } on ArgumentError catch (error) {
//         print("ArgumentError: " + error.message);
//         throw error;
//       } catch (error) {
//         print("Exception: " + error);
//         throw error;
//       }
//     } else {
//       print('error');
//       Map<String, dynamic> fResponse = Map<String, dynamic>();
//       fResponse['status'] = false;
//       fResponse['msg'] = "Please check your internet and try again";
//       return fResponse;
//     }
//   }
// }

// class CustomMultipartObject {
//   File file;
//   String param;

//   CustomMultipartObject({this.file, this.param});
// }
