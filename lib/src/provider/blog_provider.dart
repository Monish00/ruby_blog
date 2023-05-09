import 'package:flutter/material.dart';
import 'package:ruby_blog/src/helpers/error_mapping.dart';

import '../models/topic.dart';
import '../repository/api_manager.dart' as api;

class BlogProvider extends ChangeNotifier {
  List<Topic>? _topics = [];
  Future<void> fetchTopics() async {
    final result = await api.get();
    try {
      final topicMap = result.data;
      _topics =
          (topicMap as List<dynamic>).map((e) => Topic.fromJson(e)).toList();
    } catch (_) {}
    notifyListeners();
  }

  Future<void> createTopic(
      String title, String description, BuildContext context) async {
    final result = await api.createTopic(title, description);
    try {
      showMessage(result?.response.toString(), context);
    } catch (_) {}
    notifyListeners();
  }

  List<Topic>? get topics => _topics;
}
