import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var responseMessage = ''.obs;
  var isLoading = false.obs;

  Future<void> registerUser() async {
    isLoading.value = true;

    try {
      // Your registration API endpoint
      var apiUrl =
          'https://jatin-tagra-backend.vercel.app/api/v1/user/registration';
      var headers = {'Content-Type': 'application/json'};
      var body =
          json.encode({"email": email.value, "password": password.value});

      http.Response response =
          await http.post(Uri.parse(apiUrl), headers: headers, body: body);

      if (response.statusCode == 200) {
        var parsedResponse = json.decode(response.body);
        responseMessage.value = parsedResponse['message'];
        saveToken(parsedResponse['accessToken']);
      } else {
        responseMessage.value = 'Failed to register user';
      }
    } catch (e) {
      responseMessage.value = 'Error occurred: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login() async {
    isLoading.value = true;

    try {
      // Your login API endpoint
      var apiUrl = 'https://jatin-tagra-backend.vercel.app/api/v1/user/login';
      var headers = {'Content-Type': 'application/json'};
      var body =
          json.encode({"email": email.value, "password": password.value});

      http.Response response =
          await http.post(Uri.parse(apiUrl), headers: headers, body: body);

      if (response.statusCode == 200) {
        var parsedResponse = json.decode(response.body);
        responseMessage.value = 'Login successful';
        saveToken(parsedResponse['accessToken']);
      } else {
        responseMessage.value = 'Failed to login';
      }
    } catch (e) {
      responseMessage.value = 'Error occurred: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchData() async {
    try {
      // Your data fetching API endpoint
      var apiUrl = 'https://your-api-endpoint.com/data';
      var token = await getToken();
      var headers = {'Authorization': 'Bearer $token'};

      http.Response response =
          await http.get(Uri.parse(apiUrl), headers: headers);

      if (response.statusCode == 200) {
        var parsedResponse = json.decode(response.body);
        // Process your data as needed
        print(parsedResponse);
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}

class YourPage extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Registration, Login, and Data Fetching'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<UserController>(
            builder: (controller) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  onChanged: (value) => controller.email.value = value,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  onChanged: (value) => controller.password.value = value,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.registerUser();
                  },
                  child: Text('Register User'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    String? token = await controller.getToken();
                    if (token != null) {
                      print('User already logged in with token: $token');
                      // You can navigate to another screen or perform other actions here.
                    } else {
                      controller.login();
                    }
                  },
                  child: Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.fetchData();
                  },
                  child: Text('Fetch Data'),
                ),
                SizedBox(height: 20),
                Obx(() {
                  if (controller.isLoading.value) {
                    return CircularProgressIndicator();
                  } else {
                    return Text(
                      controller.responseMessage.value,
                      style: TextStyle(fontSize: 18),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: YourPage(),
    ),
  );
}
