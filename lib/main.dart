import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruby_blog/route_generator.dart';
import 'package:ruby_blog/src/provider/blog_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BlogProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Ruby Blog',
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData(
          primaryColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.white70,
            secondary: Colors.white70,
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
// GridView.builder(
// scrollDirection: Axis.horizontal,
// shrinkWrap: true,
// itemCount: blog.topics?.length ?? 0,
// gridDelegate:
// const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// crossAxisSpacing: 20,
// mainAxisSpacing: 20,
// ),
// itemBuilder: (context, index) {
// return ClipRRect(
// borderRadius: BorderRadius.circular(40),
// child: InkWell(
// onTap: () {},
// child: Container(
// decoration: const BoxDecoration(
// image: DecorationImage(
// image: AssetImage(
// 'assets/img/default.png',
// ),
// fit: BoxFit.fill,
// ),
// ),
// margin: const EdgeInsets.all(15),
// child: Align(
// alignment: Alignment.center,
// child: Column(
// children: [
// Text(
// blog.topics?[index].title ?? '',
// style: const TextStyle(
// fontWeight: FontWeight.w600,
// fontSize: 16,
// ),
// ),
// ],
// ),
// ),
// ),
// ),
// );
// },
// ),
