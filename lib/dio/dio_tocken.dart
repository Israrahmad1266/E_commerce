// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:jatin_e_commerce/sharedpref_file/prefs_file.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';


// class DioClinetToken {
//   Dio? dio;
//   static DioClinetToken? _instance;

//   DioClinetToken._internal() {
//     String token = SharedPreferencesHelper.getAuthToken();
//     log(token);
//     dio = Dio(
//       BaseOptions(
//         baseUrl: "http://jatin-tagra-backend.vercel.app/",
//         headers: {
//           'Authorization': 'Bearer ${SharedPreferencesHelper.getAuthToken()}'
//         },
//       ),
//     );
//     dio?.interceptors.add(
//       PrettyDioLogger(),
//     );
//   }

//   static DioClinetToken get instance {
//     _instance ??= DioClinetToken._internal();
//     return _instance!;
//   }
// }




