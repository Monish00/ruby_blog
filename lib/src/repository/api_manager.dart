import 'package:dio/dio.dart';

Future get() async {
  final dio = Dio();
  final response =
      await dio.get('https://rubyblog-9peh.onrender.com/topics.json');
  try {
    return response;
  } catch (_) {
    return response;
  }
}

Future post(String name, String email, String password) async {
  final dio = Dio();
  final response = await dio
      .post('https://rubyblog-9peh.onrender.com/users/sign_up.json', data: {
    'name': name,
    'email': email,
    'password': password,
    'encrypted_password': password,
  });
}
