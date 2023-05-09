import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

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

Future createTopic(String title, String description) async {
  final dio = Dio();
  try {
    final response =
        await dio.post('https://rubyblog-9peh.onrender.com/topics.json', data: {
      'title': title,
      'description': description,
    });
    print(response.data);
    return response;
  } on DioError catch (_) {}
}

Future deleteTopic(int? id) async {
  final dio = Dio();
  try {
    final response = await dio.delete(
      'https://rubyblog-9peh.onrender.com/topics/$id.json',
    );
    print(response.data);
    return response;
  } on DioError catch (_) {}
}
