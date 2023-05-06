import 'package:flutter/material.dart';
import 'package:ruby_blog/src/models/topic.dart';
import 'package:ruby_blog/src/pages/home.dart';
import 'package:ruby_blog/src/pages/topic_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/topic':
        return MaterialPageRoute(
            builder: (_) => TopicPage(topic: args as Topic));
      default:
        return MaterialPageRoute(builder: (_) => const Home());
    }
  }
}
